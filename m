Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E12EBF79
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Jan 2021 15:24:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 214ABC56634;
	Wed,  6 Jan 2021 14:24:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB5EFC5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 14:24:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106EM08P023822; Wed, 6 Jan 2021 15:24:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=mO+/boFA0Evv3SHdK+cQM5np1MduJcqrPx/PWF6mX8Q=;
 b=QgZrayLdB1uY/aavdL9X4udasWjeGm5RDaR/kKtweVYTeRezdnWIPMR+Rc4GPLKOYI5N
 OR1UBr4ygs3CQCjF1fZTogZOIrYCbiesDiyEia9YCbbrECkp+Be9KQ9xm06xfGkSuG5/
 52mo1Dd+r+To0/jlfplqWuFsauVzz8hTWeUYRrnFJ+ZU1hE9zWmTYtdOvWnl/ywaH9t3
 LeUVCA+5DrFv8+jruMpu+YqSTRH/o9wd58H0m5iM4ZSSPzJwBhLSBY6gK17gT0nEbPLy
 vtbp1MIgCwwWdku0T19g7AMvsAYhV0A5qNg0XOYD0rFKy9PnFuWLgoP1Pw0Ct7X+8Wby 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35teuv82dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 15:24:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1A0010002A;
 Wed,  6 Jan 2021 15:24:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4CDA2C38BB;
 Wed,  6 Jan 2021 15:24:10 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Jan
 2021 15:24:10 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 6 Jan 2021 15:24:10 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] arm: stm32mp: stm32prog: always flush DFU on start
 command for uart
Thread-Index: AQHWz7o61UBykRXY6kW9BKldq5fUl6oavvoA
Date: Wed, 6 Jan 2021 14:24:10 +0000
Message-ID: <60710cc7-8464-dfaa-68b7-173d2effbeb0@st.com>
References: <20201211133612.1.I5168c97ed041354102af2ba6ba3f5b3e5d0b9a47@changeid>
In-Reply-To: <20201211133612.1.I5168c97ed041354102af2ba6ba3f5b3e5d0b9a47@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <650F8FC7C234BE4D9CE767D2A2177DAC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_06:2021-01-06,
 2021-01-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: stm32prog: always flush DFU
 on start command for uart
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

SGkgUGF0cmlja8KgwqANCg0KT24gMTIvMTEvMjAgMTozNiBQTSwgUGF0cmljayBEZWxhdW5heSB3
cm90ZToNCj4gRnJvbTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+
DQo+DQo+IFJlbW92ZSB0aGUgdGVzdCBvbiBkYXRhLT5kZnVfc2VxLCBiZWNhdXNlIGRmdV9zZXE9
MCBub3Qgb25seSB3aGVuDQo+IHRoZSBERlUgaXMgbm90IHN0YXJ0ZWQgKG1hc2sgd2l0aCAweGZm
ZmYpLiBUaGlzIGZsdXNoIGlzIG1hbmRhdG9yeQ0KPiBhcyB0aGUgZmluYWwgdHJlYXRtZW50LCBj
b21tb24gd2l0aCBVU0IsIGlzIGRvbmUgaW4gREZVIGNhbGxiYWNrLg0KPg0KPiBUaGlzIHBhdGNo
IGF2b2lkcyBpc3N1ZSBpZiB0aGUgcmVjZWl2ZWQgbGVuZ3RoIGlzIGEgbXVsdGlwbGUgb2YNCj4g
dGhlIERGVSBwYWNrZXQuDQo+DQo+IEZvciBleGFtcGxlIGlmIHNpemUgb2YgYm9vdGZzIHBhcnRp
dGlvbiBpcyBlZ3VhbCB0byAweDQwMDAwMDAsDQo+IGRhdGEtPmRmdV9zZXE9MCBhdCB0aGUgZW5k
IG9mIHRoZSBwYXJ0aXRpb24sIHRoZSBmbHVzaCBpdCBub3QNCj4gcmVxdWVzdGVkIGFuZCB0aGUg
cGhhc2UgaXMgbm90IGluY3JlYXNlZCBpbiB0aGUgY2FsbGJhY2suDQo+IFUtQm9vdCBjb250aW51
ZSB0byByZXF1ZXN0IHRoZSBib290ZnMgaW4gdGhlIG5leHQgR2V0UGhhc2UgY29tbWFuZC4NCj4N
Cj4gRml4ZXM6IDQ2OGYwNTA4YjU4YiAoInN0bTMybXA6IHN0bTMycHJvZzogYWRkIHNlcmlhbCBs
aW5rIHN1cHBvcnQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNr
LmRlbGF1bmF5QHN0LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0
cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4NCj4gLS0tDQo+DQo+ICAuLi4vbWFjaC1zdG0zMm1w
L2NtZF9zdG0zMnByb2cvc3RtMzJwcm9nX3NlcmlhbC5jICAgfCAxMyArKysrKystLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPg0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvc3RtMzJwcm9n
X3NlcmlhbC5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvc3RtMzJwcm9n
X3NlcmlhbC5jDQo+IGluZGV4IDhhYWQ0YmU0NjcuLjhmYmE5MmIyYjUgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3RtMzJwcm9nL3N0bTMycHJvZ19zZXJpYWwuYw0K
PiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9zdG0zMnByb2dfc2Vy
aWFsLmMNCj4gQEAgLTM5NywxNCArMzk3LDEzIEBAIHN0YXRpYyB1OCBzdG0zMnByb2dfc3RhcnQo
c3RydWN0IHN0bTMycHJvZ19kYXRhICpkYXRhLCB1MzIgYWRkcmVzcykNCj4gIAkJaWYgKCFkZnVf
ZW50aXR5KQ0KPiAgCQkJcmV0dXJuIC1FTk9ERVY7DQo+ICANCj4gLQkJaWYgKGRhdGEtPmRmdV9z
ZXEpIHsNCj4gLQkJCXJldCA9IGRmdV9mbHVzaChkZnVfZW50aXR5LCBOVUxMLCAwLCBkYXRhLT5k
ZnVfc2VxKTsNCj4gLQkJCWRhdGEtPmRmdV9zZXEgPSAwOw0KPiAtCQkJaWYgKHJldCkgew0KPiAt
CQkJCXN0bTMycHJvZ19lcnIoIkRGVSBmbHVzaCBmYWlsZWQgWyVkXSIsIHJldCk7DQo+IC0JCQkJ
cmV0dXJuIHJldDsNCj4gLQkJCX0NCj4gKwkJcmV0ID0gZGZ1X2ZsdXNoKGRmdV9lbnRpdHksIE5V
TEwsIDAsIGRhdGEtPmRmdV9zZXEpOw0KPiArCQlpZiAocmV0KSB7DQo+ICsJCQlzdG0zMnByb2df
ZXJyKCJERlUgZmx1c2ggZmFpbGVkIFslZF0iLCByZXQpOw0KPiArCQkJcmV0dXJuIHJldDsNCj4g
IAkJfQ0KPiArCQlkYXRhLT5kZnVfc2VxID0gMDsNCj4gKw0KPiAgCQlwcmludGYoIlxuICByZWNl
aXZlZCBsZW5ndGggPSAweCV4XG4iLCBkYXRhLT5jdXJzb3IpOw0KPiAgCQlpZiAoZGF0YS0+aGVh
ZGVyLnByZXNlbnQpIHsNCj4gIAkJCWlmIChkYXRhLT5jdXJzb3IgIT0NCg0KUmV2aWV3ZWQtYnk6
IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPg0KDQpUaGFua3MN
Cg0KUGF0cmljZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
