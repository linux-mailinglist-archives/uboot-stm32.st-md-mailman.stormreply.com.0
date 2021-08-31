Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8BD3FCBDF
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Aug 2021 18:54:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA816C57B60;
	Tue, 31 Aug 2021 16:54:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3F0EC5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 16:54:22 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17VF4urZ014258;
 Tue, 31 Aug 2021 18:54:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DUhmJyf9eRvvd5TbH4w8JxZggtPWr4PZp0FRHFcPNP8=;
 b=wUEgHHvYyaItCpX9oETbBlPukp17GR+uEEIbg/EC3yyxosDx+4adLzVZMjpOM142Lp1X
 VTBEO91+S5AeN2FG8W4pDfjrr68hWz/visEvVCGc3EtMIzvnXRL+tvOyZ86irYzAFuzn
 GXPTtg3ARIyEIc3D5uoDoXLfhMjGhUQ+ZndvIej1a9QVDJrCYql/+B3GeJyy17CsTwL/
 W1+gMnBe30WqIWLguP+j1yuS6KtOTrvz6qIbJJCH33NbwutnfGuVCjLVtd648EwqyeRA
 Nswf4cdkVuT6MWZVL7f8oy2Xkp0z9StjFQqXE6rQP40+8/KP2R83Cwr+XJIXq74hOTsZ ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3asheh2ejs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 18:54:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11D6E10002A;
 Tue, 31 Aug 2021 18:54:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 035E721A228;
 Tue, 31 Aug 2021 18:54:20 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 18:54:19 +0200
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, <u-boot@lists.denx.de>
References: <20210826214209.254461-1-mr.nuke.me@gmail.com>
 <20210826214209.254461-6-mr.nuke.me@gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <177737e0-d279-06c2-5311-6b5dff9b1818@foss.st.com>
Date: Tue, 31 Aug 2021 18:54:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826214209.254461-6-mr.nuke.me@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_08,2021-08-31_01,2020-04-07_01
Cc: marex@denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 05/10] arm: stm32mp: bsec: Do not skip
	.probe() for SPL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkKCk9uIDgvMjYvMjEgMTE6NDIgUE0sIEFsZXhhbmRydSBHYWduaXVjIHdyb3RlOgoKPiBzdG0z
Mm1wX2JzZWNfcHJvYmUoKSB3YXMgc2tpcHBlZCBmb3IgVEZBQk9PVCBhbmQgU1BMX0JVSUxELiBU
aGUgaWRlYQo+IG9mIHNraXBwaW5nIHByb2JlKCkgaXMgdGhhdCB3ZSBjYW4ndCBhY2Nlc3MgQlNF
QyBmcm9tIHRoZSBub3JtYWwKPiB3b3JsZC4gVGhpcyBpcyB0cnVlIHdpdGggVEZBQk9PVC4gSG93
ZXZlciwgaW4gU1BMLCB3ZSBhcmUgaW4gdGhlCj4gc2VjdXJlIHdvcmxkLCBzbyBza2lwcGluZyBw
cm9iZSBpcyBpbmNvcnJlY3QuIEluIGZhY3QsIFNQTCBpcyBub3QKPiBldmVuIGJ1aWx0IHdoZW4g
VEZBQk9PVCBpcyBzZWxlY3RlZC4KPgo+IFRodXMsIG9ubHkgc2tpcCBwcm9iZSB3aXRoIFRGQUJP
T1QsIGJ1dCBub3QgU1BMX0JVSUxELgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEdhZ25p
dWMgPG1yLm51a2UubWVAZ21haWwuY29tPgo+IC0tLQo+ICAgYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L2JzZWMuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9ic2VjLmMgYi9h
cmNoL2FybS9tYWNoLXN0bTMybXAvYnNlYy5jCj4gaW5kZXggZmUzOWJkODBjZi4uYTAyZDE5YzFi
OSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvYnNlYy5jCj4gKysrIGIvYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL2JzZWMuYwo+IEBAIC01MDYsNyArNTA2LDcgQEAgc3RhdGljIGlu
dCBzdG0zMm1wX2JzZWNfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRldikKPiAgIAkgKiBvbmx5IGV4
ZWN1dGVkIGluIFUtQm9vdCBwcm9wZXIgd2hlbiBURi1BIGlzIG5vdCB1c2VkCj4gICAJICovCj4g
ICAKPiAtCWlmICghSVNfRU5BQkxFRChDT05GSUdfVEZBQk9PVCkgJiYgIUlTX0VOQUJMRUQoQ09O
RklHX1NQTF9CVUlMRCkpIHsKPiArCWlmICghSVNfRU5BQkxFRChDT05GSUdfVEZBQk9PVCkpIHsK
PiAgIAkJcGxhdCA9IGRldl9nZXRfcGxhdChkZXYpOwo+ICAgCj4gICAJCWZvciAob3RwID0gNTc7
IG90cCA8PSBCU0VDX09UUF9NQVhfVkFMVUU7IG90cCsrKQoKCmluIHRoaXMgcGFydCB0aGUgZGly
dmVyIGRvbid0IHNraXAgdGhlIEJTRUMgcHJvYmUgKHN0aWxsIHJldHVybiAwKQoKQlVUIHRoZSBC
U0VDIGRyaXZlciBza2lwIG9ubHkgdGhlIHNoYWRvdyBvZiB0aGUgT1RQCgo9PiB0aGlzIGluaXRp
YWxpc2F0aW9uIGlzIG5lY2Vzc2FyeSBvbmx5IG9uZSB0aW1lIHRvIHNhdmUgdGltZQoKYS8gZm9y
IFRGLUEgYm9vdCBpdCBpcyBkb25lIGluIFRGLUEKCmIvIGZvciBiYXNpYyBib290IChTUEwgKyBV
LUJvb3QpIGlzIG9ubHkgZG9uZSBpbiBVLUJvb3QgcHJvcGVyIChiZWNhdXNlIAppcyBub3QgbWFu
ZGF0b3J5IGluIFNQTAoKYW5kIHRoZSBVLUJvb3QgZXhlY3V0aW9uIHdhcyBmYXN0ZXIgLSBiZWZv
cmUgdGhlIGRhdGEgY2FjaGUgYWN0aXZhdGlvbiAKaW4gU1BMKQoKCldpdGggdGhpcyBwYXRjaCB0
aGUgY29weSBvZiB0aGUgT1RQIGluIHNoYWRvdyBtZW1vcnkgaXMgZG9uZSAyIHRpbWVzCgoxLyBp
biBTUEwgKEJTRUMgcHJvYmUpID0gd2l0aCBDT05GSUdfU1BMX0JVSUxECgoyLyBpbiBVLUJvb3Qg
KEJTRUMgcHJvYmUpCgpzZWUgY29tbWVudDoKCiDCoMKgwqAgLyoKIMKgwqDCoCDCoCogdXBkYXRl
IHVubG9ja2VkIHNoYWRvdyBmb3IgT1RQIGNsZWFyZWQgYnkgdGhlIHJvbSBjb2RlCiDCoMKgwqAg
wqAqIG9ubHkgZXhlY3V0ZWQgaW4gVS1Cb290IHByb3BlciB3aGVuIFRGLUEgaXMgbm90IHVzZWQK
IMKgwqDCoCDCoCovCgoKYnV0IGZvciBmYWxjb24gbW9kZSwgYXMgdGhlIExpbnV4IGRyaXZlciBl
eHBlY3RlZCB0aGUgT1RQIGFyZSBzaGFkb3dlZCwKCnRoZSBvcGVyYXRpb24gbmVlZCB0byBiZSBk
b25lIGluIFNQTCBhbmQgaW4gVS1Cb290IHByb3BlcgoKSSBwcm9wb3NlCgoKIMKgwqDCoCAvKgoK
IMKgwqDCoCDCoCogdXBkYXRlIHVubG9ja2VkIHNoYWRvdyBmb3IgT1RQIGNsZWFyZWQgYnkgdGhl
IHJvbSBjb2RlCgotwqDCoMKgIMKgKiBvbmx5IGV4ZWN1dGVkIGluIFUtQm9vdCBwcm9wZXIgd2hl
biBURi1BIGlzIG5vdCB1c2VkCgorwqDCoMKgIMKgKiBvbmx5IGV4ZWN1dGVkIGluIFUtQm9vdCBT
UEwsIGl0IGlzIGRvbmUgaW4gVEYtQSB3aGVuIHVzZWQKCiDCoMKgwqAgwqAqLwoKLQlpZiAoIUlT
X0VOQUJMRUQoQ09ORklHX1RGQUJPT1QpICYmICFJU19FTkFCTEVEKENPTkZJR19TUExfQlVJTEQp
KSB7CisJaWYgKElTX0VOQUJMRUQoQ09ORklHX1NQTF9CVUlMRCkpIHsKCgpSZWdhcmRzCgpQYXRy
aWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
