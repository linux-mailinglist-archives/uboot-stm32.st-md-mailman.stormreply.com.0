Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31047595C8
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 10:10:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4C88C16353
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 08:10:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDCD9C16353
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 08:10:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5S88l0t015459; Fri, 28 Jun 2019 10:10:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=R+BJjbXQVs2Gx1AY/PLy9PHMu9BX2PM12V8fCzkcQX4=;
 b=bnUzooYKdELoP9YfY5JBXHeejOT+0JWuNeF4HJajgubXa8fUcNgrAyzLo3Izd+FwBRlm
 oYQZgDn9OqHlO4BIWuy9XQLRpZm9JRfOZQUz26GfuOI9tdb0UxRk1oCtRP4LKSxT48XI
 8EthzkdsKMR7UNbEtqsnSq+vqhN+AR3RjuwD51Hv2uJEBL4+8gmXZpyAD4xwxJ3D5knH
 bktkBBjFR8DlXiP1GQLfLz6myqB7h0Tq3YyFPczBB4/KFjx7bBPK8lxQokaRFdahSByf
 KzzjvelHhEECUF42I0cx7EQVh9iSw44CEbYovLIh8klOkk0VkltrDEjdfIcN+JiZs/zO qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2k4w78-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 28 Jun 2019 10:10:21 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C130143;
 Fri, 28 Jun 2019 08:09:58 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9CAB116B2;
 Fri, 28 Jun 2019 08:09:58 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 28 Jun
 2019 10:09:58 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 28 Jun 2019 10:09:58 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: =?utf-8?B?W1UtQm9vdF1bUFVMTF0gdS1ib290LXN0bTMyIGZvciB2MjAxOS4wN+KAiyAo?=
 =?utf-8?Q?round_7)?=
Thread-Index: AQHVLYjg8Sjs6P9j0EqXaIju7FK51Q==
Date: Fri, 28 Jun 2019 08:09:58 +0000
Message-ID: <9aaf14ab-a667-2ac4-0586-a57f82fd4a89@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <9A7A464E252E914E9E6E7A46FA0FAB35@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_02:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] =?utf-8?q?=5BU-Boot=5D=5BPULL=5D_u-boot-stm32_for_v?=
 =?utf-8?b?MjAxOS4wN+KAiyAocm91bmQgNyk=?=
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

SGkgVG9tDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNWVlYTg3NGI1ZTk4
OWU2MjUxOTgyNGFkMTQwYWEwODY0MzJkMDFlZToNCg0KwqAgTWVyZ2UgaHR0cHM6Ly9naXRsYWIu
ZGVueC5kZS91LWJvb3QvY3VzdG9kaWFucy91LWJvb3QteDg2ICgyMDE5LTA2LTIyIDEyOjA5OjMz
IC0wNDAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KwqAg
aHR0cHM6Ly9naXRsYWIuZGVueC5kZS91LWJvb3QvY3VzdG9kaWFucy91LWJvb3Qtc3RtIHRhZ3Mv
dS1ib290LXN0bTMyLTIwMTkwNjI4DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAz
NmNiNzkzYjM1MzMzZTlhMjgxNDQ1MzEzZGU2ZGIxY2E0YTZhYjNhOg0KDQrCoCBtYWNoLXN0bTMy
OiBGaXggTVBVIHJlZ2lvbiBzaXplIGRlZGljYXRlZCB0byBTRFJBTSBmb3IgU1RNMzJGNCAoMjAx
OS0wNi0yOCAwOTo0NToyNyArMDIwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KU1RNMzIgTUNVIGZpeGVzL2NsZWFu
dXA6DQpfIEZpeCBTUEwgY29uc29sZSBmb3IgU1RNMzJGNzY5IERpc2NvdmVyeQ0KXyBGaXggTWVt
b3J5IFByb3RlY3Rpb24gVW5pdCBzaXplIGZvciBTVE0zMkY0IHNlcmllcw0KXyBDbGVhbnVwIERU
IGZvciBTVE0zMkY3NDYgRGlzY292ZXJ5DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClBhdHJpY2UgQ2hvdGFyZCAoMyk6
DQrCoMKgwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIHUtYm9vdCwgZG0tcHJlLXJlbG9jIGZv
ciB1c2FydDFfcGluc19hIGZvciBzdG0zMmY3NjktZGlzY28NCsKgwqDCoMKgwqAgQVJNOiBkdHM6
IHN0bTMyOiBSZW1vdmUgdXNlbGVzcyB1LWJvb3QsIGRtLXByZS1yZWxvYyBpbiBzdG0zMmY3NDYt
ZGlzY28tdS1ib290LmR0c2kNCsKgwqDCoMKgwqAgbWFjaC1zdG0zMjogRml4IE1QVSByZWdpb24g
c2l6ZSBkZWRpY2F0ZWQgdG8gU0RSQU0gZm9yIFNUTTMyRjQNCg0KwqBhcmNoL2FybS9kdHMvc3Rt
MzJmNzQ2LWRpc2NvLXUtYm9vdC5kdHNpIHzCoCA2IC0tLS0tLQ0KwqBhcmNoL2FybS9kdHMvc3Rt
MzJmNzY5LWRpc2NvLXUtYm9vdC5kdHNpIHwgMTAgKysrKysrKysrKw0KwqBhcmNoL2FybS9tYWNo
LXN0bTMyL3NvYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstDQrCoDMg
ZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCg0KDQpUaGFu
a3MNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==
