Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D312647B7
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 16:06:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3A25C3FAFE
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 14:06:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA478C3FAE3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 14:06:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AE33Ye000378; Thu, 10 Sep 2020 16:06:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6uA5lwqWmIApAANBrJ4DnkZjayKjer8sHSAJ/KAguWU=;
 b=UY1o0GP8qUoDpPmPUC3iNh5Q5kcTl5TzE/LZ3aBUifooSV3Jyo1UWV6m1q72wHtEzCzd
 EphaAEVyJNCYq7nS17h51UKFLzWmcM8y0/Ay1qXkUNmSNG5tt5KtoB298fGCKhEl/5iB
 36LWC4lB3kHvdwG9Hry+rckQQy9qipUyi97jhAgV3bo0TZne4iT6irpyuGEjaYLQG6Qc
 60JUHDoOnd/1EXd+zBb4UEO3pN+dIZmy829/ko3CaRg6ZC61tziLit3Qw3e4mXHpehuZ
 7n9FLyKjCHyIukIjsKAG646txzdXXRGkAp19XubrPNxBhfjhCk1MmQdU5XPJlhladK5M fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c051kkj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 16:06:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83824100034;
 Thu, 10 Sep 2020 16:06:39 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag6node6.st.com [10.75.127.82])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 686702ADA18;
 Thu, 10 Sep 2020 16:06:39 +0200 (CEST)
Received: from GPXDAG6NODE4.st.com (10.75.127.80) by GPXDAG6NODE6.st.com
 (10.75.127.82) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 16:06:39 +0200
Received: from GPXDAG6NODE4.st.com ([fe80::4c1e:1db5:6168:d6fc]) by
 GPXDAG6NODE4.st.com ([fe80::4c1e:1db5:6168:d6fc%19]) with mapi id
 15.00.1473.003; Thu, 10 Sep 2020 16:06:39 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] video: stm32_ltdc: Convert to use APIs which support
 live DT
Thread-Index: AQHWhsAYDIyQzz7CWUObpGoKOpouV6lhyCsA
Date: Thu, 10 Sep 2020 14:06:38 +0000
Message-ID: <4ed7e372-b468-3858-c765-89b93ecd3422@st.com>
References: <20200909154413.28064-1-patrick.delaunay@st.com>
In-Reply-To: <20200909154413.28064-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <425464D841F7B64B8640F51C8336BDC4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_03:2020-09-10,
 2020-09-10 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Anatolij Gustschin <agust@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] video: stm32_ltdc: Convert to use
 APIs which support live DT
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

UmV2aWV3ZWQtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KDQoN
Ck9uIDkvOS8yMCA1OjQ0IFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOg0KPiBVc2Ugb2Zub2Rl
XyBvciBkZXZfIEFQSXMgaW5zdGVhZCBvZiBmZHRfIGFuZCBmZHRkZWNfIEFQSXMgc28gdGhhdCB0
aGUNCj4gZHJpdmVyIGNhbiBzdXBwb3J0IGxpdmUgRFQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gLS0tDQo+IA0KPiAg
IGRyaXZlcnMvdmlkZW8vc3RtMzIvc3RtMzJfbHRkYy5jIHwgMyArLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRjLmMgYi9kcml2ZXJzL3ZpZGVvL3N0bTMyL3N0
bTMyX2x0ZGMuYw0KPiBpbmRleCAyZjM0MjdhMzJlLi43ZmZmNzM1OTMwIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2x0ZGMuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVv
L3N0bTMyL3N0bTMyX2x0ZGMuYw0KPiBAQCAtMzY2LDggKzM2Niw3IEBAIHN0YXRpYyBpbnQgc3Rt
MzJfbHRkY19wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KQ0KPiAgIA0KPiAgIAlyZXQgPSBwYW5l
bF9nZXRfZGlzcGxheV90aW1pbmcocGFuZWwsICZ0aW1pbmdzKTsNCj4gICAJaWYgKHJldCkgew0K
PiAtCQlyZXQgPSBmZHRkZWNfZGVjb2RlX2Rpc3BsYXlfdGltaW5nKGdkLT5mZHRfYmxvYiwNCj4g
LQkJCQkJCSAgIGRldl9vZl9vZmZzZXQocGFuZWwpLA0KPiArCQlyZXQgPSBvZm5vZGVfZGVjb2Rl
X2Rpc3BsYXlfdGltaW5nKGRldl9vZm5vZGUocGFuZWwpLA0KPiAgIAkJCQkJCSAgIDAsICZ0aW1p
bmdzKTsNCj4gICAJCWlmIChyZXQpIHsNCj4gICAJCQlkZXZfZXJyKGRldiwgImRlY29kZSBkaXNw
bGF5IHRpbWluZyBlcnJvciAlZFxuIiwgcmV0KTsNCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
