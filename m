Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 213269F6395
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:43:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE764C78012;
	Wed, 18 Dec 2024 10:43:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 906EAC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:43:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60KY1011155;
 Wed, 18 Dec 2024 11:42:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OfShzcGFgqvffvmdn9sJQiIvRj2oCnlhYYOcVkn6qZ4=; b=BKseRJCqtWmUpMdQ
 i5UWsQjC+c5MoJaPmJd2mOUTp/FrYCGtp57v4ySIQxRpOG8X5LKEQcaQYrOyfUPb
 0Ue9dd6slOymKNF/vztncRbdDlKhhAK8pRpRKZjB0T11OC5eMTOuE8UBuO+uAvxY
 FUGqoUYZj5DgVsutPVt9WOi10yruuMnS6c2NPKG0yAtFZNSlampL+1+pzVKurdFD
 KkoqvdGuWi5awJ0JqRJN006OaQULUFLv52nAIL0XjklX1IAfy5nzcLgycv/HBmjf
 tetQAgeOejyZlm3Jl34C1Gine/0TP9+SPY8dl9uS8RgZWQCYv3hXagI+aCsC8pvz
 t4S0pw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcs4rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:42:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 231A240046;
 Wed, 18 Dec 2024 11:41:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D71EB268961;
 Wed, 18 Dec 2024 11:40:06 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:40:06 +0100
Message-ID: <eb4c25a5-f939-4280-a8a8-1d6d63dfbb65@foss.st.com>
Date: Wed, 18 Dec 2024 11:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20241218075833.2049241-1-patrice.chotard@foss.st.com>
 <268def1b-0b7f-453b-b079-885ea3e49bb4@foss.st.com>
 <290b3572-bc50-410d-bba0-3e204e68bc56@foss.st.com>
Content-Language: en-US
In-Reply-To: <290b3572-bc50-410d-bba0-3e204e68bc56@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Greg Malysa <greg.malysa@timesys.com>, Paul Kocialkowski <contact@paulk.fr>,
 Hiago De Franco <hiago.franco@toradex.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Subject: Re: [Uboot-stm32] [PATCH] Kconfig: Set STACK_SIZE to 16KB for STM32
	MCUs
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

CgpPbiAxMi8xOC8yNCAxMToyOCwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IAo+IE9uIDEy
LzE4LzI0IDEwOjU5LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+PiBIaQo+Pgo+PiBPbiAxMi8x
OC8yNCAwODo1OCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+Pj4gU2luY2UgY29tbWl0IDY1MzRk
MjZlZTlhNSAoImxtYjogZG8gYXdheSB3aXRoIGFyY2hfbG1iX3Jlc2VydmUoKSIpLAo+Pj4gU1RN
MzJGNzQ2LWRpc2NvIGhhbmdzIHdoZW4gbG9hZGluZyBkZXZpY2UgdHJlZSBqdXN0IGJlZm9yZSBz
dGFydGluZwo+Pj4ga2VybmVsOgo+Pj4KPj4+IFJldHJpZXZpbmcgZmlsZTogL3N0bTMyZjc0Ni1k
aXNjby5kdGIKPj4+IEtlcm5lbCBpbWFnZSBAIDB4YzAwMDgwMDAgWyAweDAwMDAwMCAtIDB4MTlh
ZTAwIF0KPj4+IEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIGF0IGMwNDA4MDAwCj4+PiDCoMKg
wqAgQm9vdGluZyB1c2luZyB0aGUgZmR0IGJsb2IgYXQgMHhjMDQwODAwMAo+Pj4gV29ya2luZyBG
RFQgc2V0IHRvIGMwNDA4MDAwCj4+PiDCoMKgwqAgTG9hZGluZyBEZXZpY2UgVHJlZSB0byBjMDVm
ODAwMCwgZW5kIGMwNWZmNzFjIC4uLgo+Pj4KPj4+IEFkanVzdCBTVEFDS19TSVpFIHRvIDE2S0Ig
Zm9yIFNUTTMyIE1DVXMgKEY0L0Y3IGFuZCBINykgYm9hcmRzCj4+PiB0byBmaXgga2VybmVsIGJv
b3QgcHJvY2VzcyBhcyBzb21lIG9mIHRoZXNlIGJvYXJkcyBlbWJlZHMgYSBsaW1pdGVkCj4+PiBh
bW91bnQgb2YgbWVtb3J5Lgo+Pj4KPj4+IEZpeGVzOiA2NTM0ZDI2ZWU5YTUgKCJsbWI6IGRvIGF3
YXkgd2l0aCBhcmNoX2xtYl9yZXNlcnZlKCkiKQo+Pgo+Pgo+PiBJIHRoaW5rIGl0IGlzIGFsc28g
bGlua2VkIHRvIGFuIG90aGVyIGNvbW1pdAo+Pgo+PiBGaXhlczo3NGI4NjliYWU3NGMgKCJlZmlf
bG9hZGVyOiB1c2UgQ09ORklHX1NUQUNLX1NJWkUgaW4gdGhlIFVFRkkgc3ViLXN5c3RlbSIpCj4+
Cj4+IGJlZm9yZSB0aGUgcGF0Y2ggQ09ORklHX1NFVF9TVEFDS19TSVpFIHdhcyBub3QgZGVmaW5l
ZCBmb3IgQUxMIEFSTSBwbGF0Zm9ybQo+Pgo+PiBTbyBDT05GSUdfU1RBQ0tfU0laRSB3YXMgbm90
IGRlZmluZWTCoCAvIGFuZCB3YXMgbm8gdXNlZCBpbiBwbGF0Zm9ybQo+Pgo+PiAoVS1Cb290IHN0
YWNrIHVwIHRvIGVuZCBvZiB0aGUgVS1Cb290IGFyZWEpCj4+Cj4+IGFmdGVyIHRoZSBwYXRjaCB0
aGUgQ09ORklHX1NUQUNLX1NJWkVpcyBzZXQgYSAxNk1CIGZvciBhbGwgcGxhdGZvcm0sIGV2ZW4g
aWYgRUZJIGlzIG5vdCB1c2VkCj4+Cj4+Cj4+ICtjb25maWcgU1RBQ0tfU0laRQo+PiArwqDCoMKg
IGhleCAiRGVmaW5lIG1heCBzdGFjayBzaXplIHRoYXQgY2FuIGJlIHVzZWQgYnkgVS1Cb290Igo+
Pgo+PiArwqDCoMKgIGRlZmF1bHQgMHg0MDAwMDAwIGlmIEFSQ0hfVkVSU0FMIHx8IEFSQ0hfWllO
UU1QCj4+ICvCoMKgwqAgZGVmYXVsdCAweDIwMDAwMCBpZiBNSUNST0JMQVpFCj4+ICvCoMKgwqAg
ZGVmYXVsdCAweDEwMDAwMDAKPj4KPj4KPj4gMTZNQiBpcyBuZWVkZWQgT05MWSBmb3IgRUZJIGxv
YWRlciBjYXNlcywgZm9yIG90aGVyIHBsYXRmb3JtIHRoYXQgc2VlbXMgaHVnZS4KPj4KPj4KPj4g
QEhlaW5yaWNoOiBkbyB5b3UgdGhpbmsgeW91IGNhbiBhZGQgdGhpcyBjb25kaXRpb24gQ09ORklH
X0VGSV9MT0FERVIgdG8gYXZvaWQgaXNzdWUgZm9yIG90aGVyIHBsYXRmb3JtcyA9Cj4+Cj4+IFNv
IHVzZSAxNk1CIChwcmV2aW91c2x5IGhhcmRjb2RlZCBpbiBsaWIvZWZpX2xvYWRlci9lZmlfbWVt
b3J5LmMgd2l0aCBhZGRfdV9ib290X2FuZF9ydW50aW1lKCkgKQo+Pgo+PiDCoMKgwqAgZGVmYXVs
dCAweDEwMDAwMDAgaWYgRUZJX0xPQURFUgo+Pgo+Pgo+PiBhbmQgc28gZm9yY2UgdGhlIG90aGVy
IHBsYXRmb3JtcyB0byBkZWZpbmUgdGhlIENPTkZJR19TVEFDS19TSVpFIChub3cgdXNlZCBpbiBM
TUIpIHdpdGggYW4gYWRlcXVhdGUgdmFsdWUgPwo+Pgo+Pgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pj4gLS0tCj4+
Pgo+Pj4gwqAgS2NvbmZpZyB8IDEgKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0tjb25maWcgYi9LY29uZmlnCj4+PiBpbmRleCAxZjVi
MGYxOTcyZC4uYzA4N2E0MjBhMjQgMTAwNjQ0Cj4+PiAtLS0gYS9LY29uZmlnCj4+PiArKysgYi9L
Y29uZmlnCj4+PiBAQCAtNTc4LDYgKzU3OCw3IEBAIGNvbmZpZyBTVEFDS19TSVpFCj4+PiDCoMKg
wqDCoMKgIGhleCAiRGVmaW5lIG1heCBzdGFjayBzaXplIHRoYXQgY2FuIGJlIHVzZWQgYnkgVS1C
b290Igo+Pj4gwqDCoMKgwqDCoCBkZWZhdWx0IDB4NDAwMDAwMCBpZiBBUkNIX1ZFUlNBTF9ORVQg
fHwgQVJDSF9WRVJTQUwgfHwgQVJDSF9aWU5RTVAKPj4+IMKgwqDCoMKgwqAgZGVmYXVsdCAweDIw
MDAwMCBpZiBNSUNST0JMQVpFCj4+PiArwqDCoMKgIGRlZmF1bHQgMHg0MDAwIGlmIEFSQ0hfU1RN
MzIKPj4+IMKgwqDCoMKgwqAgZGVmYXVsdCAweDEwMDAwMDAKPj4+IMKgwqDCoMKgwqAgaGVscAo+
Pj4gwqDCoMKgwqDCoMKgwqAgRGVmaW5lIE1heCBzdGFjayBzaXplIHRoYXQgY2FuIGJlIHVzZWQg
YnkgVS1Cb290LiBUaGlzIHZhbHVlIGlzIHVzZWQKPj4KPj4KPj4gQW55d2F5IGZvciB0aGlzIFNU
TTMyIE1DVSBwYXRjaDoKPj4KPj4KPj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBh
dHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+Cj4+IFRoYW5rcwo+PiBQYXRyaWNrCj4+Cj4g
QXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbmV4dAo+IAo+IFRoYW5rcwo+IFBhdHJpY2UKU29ycnks
IGFwcGxpZWQgdG8gdS1ib290LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
