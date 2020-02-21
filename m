Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5752F168068
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Feb 2020 15:37:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02534C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Feb 2020 14:37:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 028B1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2020 14:37:26 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LEYDCp016694; Fri, 21 Feb 2020 15:37:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=H1Q4eT/vFaNPyOQaotSvy8GMX9qV1KUt6uyznWLINA0=;
 b=GE9tGttR0UTBPwxUNa4ZXj+8kC5T1owjK8Ee2CF2iQ8mnRnknodr+HafUo72jaFYV94+
 NfbrkCyAkhkEDcbQ2fCCAF2nfp9K9kRYKtcxbdsOLnICOLP3tUDz8VA+AOYmzkKnMvxx
 4J7cncGMACMpukZJ4a1lkqnWbzmHcBQkxXI+2LYlFEiPKW8E+4LlJdul5ouKOSV2UAyL
 j3rdmn0Z0ztCMQQu9S+i4ensG1dLGWWqA9z01Znsv+HmUrgrzzc4RTj8eWLg783MM/Hg
 bhtg4TjO08nBm5tlpAnjdtMYktKIDg3YBzJ/OT2sFV6b3EzglgU0bgc3jq58sj239IwH Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y8ub1qqn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 15:37:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D61F910002A;
 Fri, 21 Feb 2020 15:37:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C7CB2B7393;
 Fri, 21 Feb 2020 15:37:19 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 15:37:19 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 21 Feb 2020 15:37:19 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 1/8] phy: generic: add error trace to detect PHY issue
 in uclass
Thread-Index: AQHV5jbTHeNXLH9wI0mGXQisQ07MyaghJ8sAgASUSdA=
Date: Fri, 21 Feb 2020 14:37:19 +0000
Message-ID: <2dee9efe9c034d0cad4076b946ddb3ef@SFHDAG6NODE3.st.com>
References: <20200218083836.6369-1-patrick.delaunay@st.com>
 <8bd74f07-98a0-4ca7-d189-a55c01ce08a1@denx.de>
In-Reply-To: <8bd74f07-98a0-4ca7-d189-a55c01ce08a1@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_04:2020-02-21,
 2020-02-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/8] phy: generic: add error trace to
 detect PHY issue in uclass
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

SGkgTWFyZWssDQoNCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+IFNlbnQ6
IG1hcmRpIDE4IGbDqXZyaWVyIDIwMjAgMTg6NDANCj4gDQo+IE9uIDIvMTgvMjAgOTozOCBBTSwg
UGF0cmljayBEZWxhdW5heSB3cm90ZToNCj4gWy4uLl0NCj4gPiAgc3RhdGljIGlubGluZSBzdHJ1
Y3QgcGh5X29wcyAqcGh5X2Rldl9vcHMoc3RydWN0IHVkZXZpY2UgKmRldikgIHsgQEANCj4gPiAt
MTA5LDU2ICsxMTAsODYgQEAgaW50IGdlbmVyaWNfcGh5X2dldF9ieV9uYW1lKHN0cnVjdCB1ZGV2
aWNlICpkZXYsDQo+ID4gY29uc3QgY2hhciAqcGh5X25hbWUsICBpbnQgZ2VuZXJpY19waHlfaW5p
dChzdHJ1Y3QgcGh5ICpwaHkpICB7DQo+ID4gIAlzdHJ1Y3QgcGh5X29wcyBjb25zdCAqb3BzOw0K
PiA+ICsJaW50IHJldDsNCj4gPg0KPiA+ICAJaWYgKCFwaHkpDQo+ID4gIAkJcmV0dXJuIDA7DQo+
ID4gIAlvcHMgPSBwaHlfZGV2X29wcyhwaHktPmRldik7DQo+ID4NCj4gPiAtCXJldHVybiBvcHMt
PmluaXQgPyBvcHMtPmluaXQocGh5KSA6IDA7DQo+ID4gKwlyZXQgPSBvcHMtPmluaXQgPyBvcHMt
PmluaXQocGh5KSA6IDA7DQo+IA0KPiBpZiAoIW9wcy0+aW5pdCkNCj4gICAgcmV0dXJuIDA7DQo+
IHJldCA9IG9wcy0+aW5pdCgpOw0KPiBpZiAocmV0KQ0KPiAgICBkZXZfZXJyLi4uDQo+IA0KPiBy
ZXR1cm4gcmV0Ow0KPiANCj4gUGxlYXNlIGZpeCBnbG9iYWxseS4NCg0KWWVzIGl0IGlzIG1vcmUg
Y2xlYXIsIEkgYW0gdGhlIHYzIHNlcmllDQogDQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWRldl9l
cnIocGh5LT5kZXYsICJQSFk6IEZhaWxlZCB0byBpbml0ICVzOiAlZC5cbiIsDQo+ID4gKwkJCXBo
eS0+ZGV2LT5uYW1lLCByZXQpOw0KPiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+IFsuLi5dDQoN
ClJlZ2FyZHMsDQoNClBhdHJpY2sNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
