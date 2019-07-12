Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C127D670F3
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 16:03:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F90FD41424
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:03:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF5F0D41422
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 14:03:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CE1LM2029153; Fri, 12 Jul 2019 16:03:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=v8TG4mt07ujFj29ZSjVuBbpG4Yi3lPSvIQ8qcxHQq5Q=;
 b=bgw65gjk7NoduXanIyAQUu+2vnqmnEPk0cGaFlVuOWA1s9VyxmptWFHU+z7BU41R8BEz
 NLAPLhkY+73QF171HRE8S9KFoARXuPI5sdBDhmf7e1hPA8+RdG2CUO6sLc6UYflLq8m4
 Zw4SDYfNu7YxshjQUN/rzRRVEpiJrt1oUrNjBAT5IgIJnoBJ5rVYLGjaFal+1tcMsULo
 vZu8pcT/EphvEnUXovGi/D2Wmnw3f4zp0MY10rQLXn2lO9xkGUVk5JC4MVGpyj5b/zTU
 kAl4ML7n6c97LJsHPB8TQClo1YA58WBSwutr+OyWWCE983PYkkDGXLkMo8CdVvafNvwv Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tpj3tkeka-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 16:03:09 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 648DB31;
 Fri, 12 Jul 2019 14:03:08 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40E054E65;
 Fri, 12 Jul 2019 14:03:08 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 16:03:07 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 16:03:07 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 19/20] psci: Fix warnings when compiling with W=1
Thread-Index: AQHVKDUQEWc/U7+4n0K3FnqVkzs0iqbHJBBA
Date: Fri, 12 Jul 2019 14:03:07 +0000
Message-ID: <3f9c38f46f604494a272905cc630fc70@SFHDAG6NODE3.st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
 <1561123618-2029-19-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1561123618-2029-19-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Stefan Agner <stefan.agner@toradex.com>, Anson Huang <Anson.Huang@nxp.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, "NXP i.MX
 U-Boot Team" <uboot-imx@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Stefano Babic <sbabic@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 19/20] psci: Fix warnings when compiling
	with W=1
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

SGksDQoNCj4gRnJvbTogUGF0cmljayBERUxBVU5BWSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+
DQo+IFNlbnQ6IHZlbmRyZWRpIDIxIGp1aW4gMjAxOSAxNToyNw0KPiANCj4gVGhpcyBwYXRjaCBz
b2x2ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoNCj4gYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3Bz
Y2kuYzoNCj4gDQo+IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcHNjaV9z
ZXRfc3RhdGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQ0KPiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmHBzY2lfYXJjaF9jcHVfZW50cnnigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQ0KPiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBzY2lfZmVh
dHVyZXPigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQ0KPiB3YXJuaW5nOiBubyBwcmV2aW91cyBw
cm90b3R5cGUgZm9yIOKAmHBzY2lfdmVyc2lvbuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdDQo+
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcHNjaV9hZmZpbml0eV9pbmZv
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10NCj4gd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhwc2NpX21pZ3JhdGVfaW5mb190eXBl4oCZIFstV21pc3NpbmctDQo+IHByb3Rv
dHlwZXNdDQo+IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcHNjaV9jcHVf
b27igJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQ0KPiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmHBzY2lfY3B1X29mZuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdDQo+IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcHNjaV9zeXN0ZW1fcmVzZXTigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQ0KPiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUg
Zm9yIOKAmHBzY2lfc3lzdGVtX29mZuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4N
Cj4gLS0tDQo+IA0KPiAgYXJjaC9hcm0vaW5jbHVkZS9hc20vc3lzdGVtLmggICAgICAgfCAxNCAr
KysrKysrKysrKysrKw0KPiAgYXJjaC9hcm0vbWFjaC1pbXgvbXg3L3BzY2ktbXg3LmMgICAgfCAg
MiArLQ0KPiAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3BzY2kuYyAgICAgICAgfCAxOCArKysrKysr
KystLS0tLS0tLS0NCj4gIGFyY2gvYXJtL21hY2gtdW5pcGhpZXIvYXJtMzIvcHNjaS5jIHwgIDQg
KystLQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkNCj4gDQoNCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL21hc3RlciwgdGhhbmtzIQ0KDQpQYXRy
aWNrDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
