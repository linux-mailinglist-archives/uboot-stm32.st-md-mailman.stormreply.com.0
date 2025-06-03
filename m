Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA673ACC7C8
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jun 2025 15:29:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FC07C349C2;
	Tue,  3 Jun 2025 13:29:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E6D3C349C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 13:28:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553BKtnt024974;
 Tue, 3 Jun 2025 15:28:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zPJdOmNuuzdc/T68Gn6g9G2vlEeWvIDBlnqavUeP+d0=; b=2EZIEKCVAJtop/iL
 Hlntn3oh7n0u0Fea1YPm0hkB58cjiMSRUvzVBYKq0tkYvD8oq3FBACOnv5f7K7d5
 kZpv8eqLbWfZT4mbz94K3DW6Tve22jxmGQD4AjpF3dVt9JMaLF/xYYJi45HUPpzc
 VQbUefU9QwgiMXhNPcBD0Di3VleHADKO4txrIdYuJOpjVD889OXd6rM3UPMc3q2C
 sniUbyIDa6je63mroSYed5oMQY+sJzvhpCYVbtmHjSbDC51yHNiOkHSn78wWO/UT
 h2nve6fOwuXo4RubJuiNzmkz7zl9VCn2JScX0m9aqy0g1vyHukvQ/0dIx8ASbC2F
 /uL7Rw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g8v47ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jun 2025 15:28:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8B3D64006A;
 Tue,  3 Jun 2025 15:27:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 51D17B13F6F;
 Tue,  3 Jun 2025 15:26:59 +0200 (CEST)
Received: from [10.48.86.182] (10.48.86.182) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 15:26:58 +0200
Message-ID: <ce033305-387b-4732-a711-5a4a9f4237e3@foss.st.com>
Date: Tue, 3 Jun 2025 15:26:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-2-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250512172149.150214-2-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: Re: [Uboot-stm32] [PATCH 01/10] ARM: stm32: Add STM32MP13xx SPL
	Kconfig options
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

SGksCgpPbiA1LzEyLzI1IDE5OjIxLCBNYXJlayBWYXN1dCB3cm90ZToKPiBJbnRyb2R1Y2UgS2Nv
bmZpZyBvcHRpb25zIHVzZWQgYnkgU1BMIG9uIFNUTTMyTVAxM3h4IGFuZCBpc29sYXRlCj4gdGhl
IEtjb25maWcgb3B0aW9ucyBvbmx5IHVzZWQgaW4gY2FzZSBURkEgQkwyIGlzIHVzZWQgYXMgYSBT
UEwKPiBiZWhpbmQgQ09ORklHX1RGQUJPT1QgZGVwZW5kZW5jeS4KPgo+IFNpZ25lZC1vZmYtYnk6
IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBtYWlsYm94Lm9yZz4KPiAtLS0KPiBDYzogQ2hlaWNr
IFRyYW9yZSA8Y2hlaWNrLnRyYW9yZUBmb3NzLnN0LmNvbT4KPiBDYzogRmFicmljZSBHYXNuaWVy
IDxmYWJyaWNlLmdhc25pZXJAZm9zcy5zdC5jb20+Cj4gQ2M6IEdhdGllbiBDaGV2YWxsaWVyIDxn
YXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4KPiBDYzogTGlvbmVsIERlYmlldmUgPGxpb25l
bC5kZWJpZXZlQGZvc3Muc3QuY29tPgo+IENjOiBQYXNjYWwgWmltbWVybWFubiA8cHppbW1lcm1h
bm5AZGgtZWxlY3Ryb25pY3MuY29tPgo+IENjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hv
dGFyZEBmb3NzLnN0LmNvbT4KPiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5h
eUBmb3NzLnN0LmNvbT4KPiBDYzogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gQ2M6
IFN1Z2hvc2ggR2FudSA8c3VnaG9zaC5nYW51QGxpbmFyby5vcmc+Cj4gQ2M6IFRvbSBSaW5pIDx0
cmluaUBrb25zdWxrby5jb20+Cj4gQ2M6IHUtYm9vdEBkaC1lbGVjdHJvbmljcy5jb20KPiBDYzog
dS1ib290QGxpc3RzLmRlbnguZGUKPiBDYzogdWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQo+IC0tLQo+ICAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tjb25maWcgICAgIHwg
NyArKysrKy0tCj4gICBhcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZpZy4xM3ggfCAzICsrLQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tjb25maWcgYi9hcmNoL2FybS9tYWNo
LXN0bTMybXAvS2NvbmZpZwo+IGluZGV4IDU4MjUwOTAxMTAxLi4zYTBjYTUwZTlkNiAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZpZwo+ICsrKyBiL2FyY2gvYXJtL21h
Y2gtc3RtMzJtcC9LY29uZmlnCj4gQEAgLTQwLDE2ICs0MCwxOSBAQCBjaG9pY2UKPiAgIGNvbmZp
ZyBTVE0zMk1QMTNYCj4gICAJYm9vbCAiU3VwcG9ydCBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzJN
UDEzeCBTb2MiCj4gICAJc2VsZWN0IEFSQ0hfRUFSTFlfSU5JVF9SCj4gLQlzZWxlY3QgQVJNX1NN
Q0NDCj4gKwlzZWxlY3QgQVJNX1NNQ0NDIGlmIFRGQUJPT1QKPiArCXNlbGVjdCBBUkNIX1NVUFBP
UlRfUFNDSSBpZiAhVEZBQk9PVAo+ICsJc2VsZWN0IEJJTk1BTiBpZiAhVEZBQk9PVAo+ICAgCXNl
bGVjdCBDUFVfVjdBCj4gICAJc2VsZWN0IENQVV9WN19IQVNfTk9OU0VDCj4gICAJc2VsZWN0IENQ
VV9WN19IQVNfVklSVAo+IC0Jc2VsZWN0IE9GX0JPQVJECj4gKwlzZWxlY3QgT0ZfQk9BUkQgaWYg
VEZBQk9PVAo+ICAgCXNlbGVjdCBPRl9CT0FSRF9TRVRVUAo+ICAgCXNlbGVjdCBQSU5DVFJMX1NU
TTMyCj4gICAJc2VsZWN0IFNUTTMyX1JDQwo+ICAgCXNlbGVjdCBTVE0zMl9SRVNFVAo+ICAgCXNl
bGVjdCBTVE0zMl9TRVJJQUwKPiArCXNlbGVjdCBTVVBQT1JUX1NQTCBpZiAhVEZBQk9PVAo+ICAg
CXNlbGVjdCBTWVNfQVJDSF9USU1FUgo+ICAgCWltcGx5IENNRF9OVkVESVRfSU5GTwo+ICAgCWlt
cGx5IE9GX1VQU1RSRUFNCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29u
ZmlnLjEzeCBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmlnLjEzeAo+IGluZGV4IGJjOGIz
ZjhjZjc3Li5jZWNmOWUzYjhjNyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAv
S2NvbmZpZy4xM3gKPiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZpZy4xM3gKPiBA
QCAtMjAsNyArMjAsOCBAQCBjb25maWcgVEFSR0VUX1NUX1NUTTMyTVAxM1gKPiAgIGVuZGNob2lj
ZQo+ICAgCj4gICBjb25maWcgVEVYVF9CQVNFCj4gLQlkZWZhdWx0IDB4QzAwMDAwMDAKPiArCWRl
ZmF1bHQgMHhDMDAwMDAwMCBpZiBURkFCT09UCj4gKwlkZWZhdWx0IDB4QzAxMDAwMDAgaWYgIVRG
QUJPT1QKPiAgIAo+ICAgY29uZmlnIFBSRV9DT05fQlVGX0FERFIKPiAgIAlkZWZhdWx0IDB4QzA4
MDAwMDAKCgpJIGRvbid0IHVuZGVyc3Rvb2TCoCB3aHkgeW91IG1vZGlmeSBURVhUX0JBU0UgaGVy
ZS4KCkkgZXhwZWN0IHRvIGhhdmUgdGhlIHNhbWUgYmFzZSBhZGRyZXNzIGZvciBTUEwgb3IgZm9y
IFRGLUEgYm9vdCBldmVuIGlmIAp3ZSBkZWNpZGUgdG8gY2hhbmdlIHRoaXMgYWRkcmVzcyBiZXR3
ZWVuIFNUTTMyTVAxMyBhbmQgU1RNMzJNUDE1LgoKdGhlIG5ldyBhZGRyZXNzIGF2b2lkIHBvdGVu
dGlhbCBpc3N1ZSBvbiBpbml0aWFsIHN0YWNrIHNpemUgYXMgc2VlIG9uIApTVE0zMk1QMTUgKGxp
bWl0ZWQgYXQgMHgxMDAwMDApIGFuZCBiZWNhdXNlIHdlIGhhdmUgbm8gbW9yZSBpc3N1ZSB3aXRo
IApTVE0zMkN1YmVQcm9ncmFtbWVyIChwcmV2aW91c2x5IHRoZSBmbGFzaC1sYXlvdXQgZmlsZSB3
YXMgbG9hZGVkIGJ5IFRGLUEgCmF0IDB4QzAwMDAwMDApLgoKV2UgZG9uJ3QgY2hhbmdlIFNUTTMy
TVAxNSBqdXN0IHRvIGF2b2lkIHRvIGJyZWFrIHRoZSBjb21wYXRpYmlsaXR5Li4uCgpUaGUgZGVm
YXVsdCBtZW1vcnkgaXMgZnVsbHkgZGVzY3JpYmVkIGhlcmU6CgpodHRwczovL3dpa2kuc3QuY29t
L3N0bTMybXB1L3dpa2kvSG93X3RvX2NvbmZpZ3VyZV9VLUJvb3RfZm9yX3lvdXJfYm9hcmQjQmVm
b3JlX3JlbG9jYXRpb24gCgoKRm9yIFNUTTMyTVAxMyB0aGUgZGVmYXVsdCB2YWx1ZSBhcmUKCjEv
IENPTkZJR19URVhUX0JBU0UgPSAweEMwMDAwMDAwIChiZWdpbiBvZiBERFIpCgoyLyBDT05GSUdf
Q1VTVE9NX1NZU19JTklUX1NQX0FERFIgPSBDMDQwMDAwMAoKCllvdSBjaGFuZ2UgdGhlIGRlZmF1
bHQgU1RNMzJNUDEzIGJhc2UgYWRkcmVzcyB0byBrZWVwIHRoZSBTQU1FIGRlc2NyaXB0aW9uIGZv
ciB5b3UgYm9hcmQgPwoKCUNPTkZJR19TUExfTE9BRF9GSVQ9eQoJQ09ORklHX1NQTF9MT0FEX0ZJ
VF9BRERSRVNTPTB4YzEwMDAwMDAKClNvIEZJVCBpcyBsb2FkZWQgYXQgdGhlIHNhbWUgYWRkcmVz
cyB0aGFuIFUtQm9vdCA/CgpGSVQgZm9yIFNUTTMyTVAxNSB3YXMgbWFuYWdlZCB3aXRoIGJpbm1h
biBjb25maWcgaW4gYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoc29tLXUtYm9vdC5kdHNpCgoJ
CQlpbWFnZXMgewoJCQkJdWJvb3QgewoJCQkJCWFyY2ggPSAiYXJtIjsKCQkJCQljb21wcmVzc2lv
biA9ICJub25lIjsKCQkJCQlkZXNjcmlwdGlvbiA9ICJVLUJvb3QgKDMyLWJpdCkiOwoJCQkJCWVu
dHJ5ID0gPENPTkZJR19URVhUX0JBU0U+OwoJCQkJCWxvYWQgPSA8Q09ORklHX1RFWFRfQkFTRT47
CgkJCQkJdHlwZSA9ICJzdGFuZGFsb25lIjsKCgkJCQkJdWJvb3QtYmxvYiB7CgkJCQkJCWZpbGVu
YW1lID0gInUtYm9vdC1ub2R0Yi5iaW4iOwoJCQkJCQl0eXBlID0gImJsb2ItZXh0IjsKCQkJCQl9
OwoJCQkJfTsKCkkgZG9uJ3Qgc3VyZSBpdCBpcyB0aGUgc2FtZSBmb3IgU1RNMzJNUDEzIGFmdGVy
IGFmdGVyIHlvdXIgc2VyaWUuLi4uLgoKCkFueXdheSBJIHRoaW5rIHRoZSBiZXR0ZXIgc29sdXRp
b24gdG8gYXZvaWQgYSBleHRyYSBjb3B5IGlzIHRvIGxvYWQgRklUIGFmdGVyIGZpbmFsIFUtQm9v
dCBsb2NhdGlvbiBpbiBERFIKCkNPTkZJR19TUExfTE9BRF9GSVRfQUREUkVTUz0weGM0MDAwMDAw
Cgo9PiB0aGlzIGFkZHJlc3MgY2FuIGJlIGlkZW50aWNhbCBmb3IgU1RNMzJNUDEzIGFuZCBTVE0z
Mk1QMTUKCmFuZCB0byBrZWVwIHRoZSB0aGUgZGVmYXVsdCB2YWx1ZSBmb3IgQ09ORklHX1RFWFRf
QkFTRQotIDB4QzAwMDAwMDAgZm9yIFNUTTMyTVAxMwotIDB4QzAxMDAwMDAgZm9yIFNUTTMyTVAx
NQoKUmVnYXJkcwoKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
