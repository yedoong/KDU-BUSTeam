var android_application_id = '629b8248e38c3000245ade54'
BootPay.request({
    price: '1000',
    application_id: android_application_id,
    name: '블링블링 마스카라',
    pg: 'danal',
    method: 'phone',
    show_agree_window: 0,
    items: [
            {
            item_name: '나는 아이템',
            qty: 1,
            unique: '123',
            price: 1000,
            cat1: 'TOP',
            cat2: '티셔츠',
            cat3: '라운드 티',
            }
    ],
    user_info: {
        username: '사용자 이름',
        email: '사용자 이메일',
        addr: '사용자 주소',
        phone: '010-1234-4567'
    },
    order_id: '고유order_id_1234',
    params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
    account_expire_at: '2020-10-25',
    extra: {
        start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
		               end_at: '2022-05-10', // 정기결제 만료일 - Default:  기간 없음 - 무제한
        vbank_result: 1,
        quota: '0,2,3'
    }
    }).error(function (data) {
         try { Android.error(JSON.stringify(data)); } catch (e){}
    }).cancel(function (data) {
         try { Android.cancel(JSON.stringify(data)); } catch (e){}
    }).ready(function (data) {
         try { Android.ready(JSON.stringify(data)); } catch (e){}
    }).confirm(function (data) {
         try { Android.confirm(JSON.stringify(data)); } catch (e){}
   }).close(function (data) {
         try { Android.close('close'); } catch (e){}
   }).done(function (data) {
         try { Android.done(JSON.stringify(data)); } catch (e){}
});