Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 713539F624B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:02:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E223C6DD9D;
	Wed, 18 Dec 2024 10:02:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25537C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:02:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60KLK011349;
 Wed, 18 Dec 2024 11:02:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Z3LkVGqH8jWg2kp/gzlL20PyEl4FMXEbgilj343Q35I=; b=BU6LogZ2tdh4ByGz
 1ELrKW9psFGJ17pXr2rtYn1Vib8Ui4EbTenfbBdCmVp9ClFXYFcb2jjEOK0XKTNC
 BtROZOu+J+VpvFZv8A1cqOrBVjncjsyEWEk2f7by2ZU/0TGrJR4cjkhGD4OJtlcm
 wi7mZqFalC47j7sbVNFReB+ho3HA32xPDixuB2cTqKfItDUM8kvfe2PW6D1y34E1
 Ge80QDc83C2sY1GYRgss76eQGvyvNgfkvKFJID4FfFfAfWd7v3+hJF6BA/dHqgEy
 zmOxt0z0lzML0WCwa3VJTDQCPfZ3puk1Qhk7TVe/Sd1WNG62dvFgJGcbQBDoUlsr
 hIn58w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcrxs4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:02:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A732440074;
 Wed, 18 Dec 2024 11:00:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFA9C25E65F;
 Wed, 18 Dec 2024 10:59:32 +0100 (CET)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:59:32 +0100
Message-ID: <268def1b-0b7f-453b-b079-885ea3e49bb4@foss.st.com>
Date: Wed, 18 Dec 2024 10:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20241218075833.2049241-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241218075833.2049241-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkKCk9uIDEyLzE4LzI0IDA4OjU4LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4gU2luY2UgY29t
bWl0IDY1MzRkMjZlZTlhNSAoImxtYjogZG8gYXdheSB3aXRoIGFyY2hfbG1iX3Jlc2VydmUoKSIp
LAo+IFNUTTMyRjc0Ni1kaXNjbyBoYW5ncyB3aGVuIGxvYWRpbmcgZGV2aWNlIHRyZWUganVzdCBi
ZWZvcmUgc3RhcnRpbmcKPiBrZXJuZWw6Cj4KPiBSZXRyaWV2aW5nIGZpbGU6IC9zdG0zMmY3NDYt
ZGlzY28uZHRiCj4gS2VybmVsIGltYWdlIEAgMHhjMDAwODAwMCBbIDB4MDAwMDAwIC0gMHgxOWFl
MDAgXQo+IEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIGF0IGMwNDA4MDAwCj4gICAgIEJvb3Rp
bmcgdXNpbmcgdGhlIGZkdCBibG9iIGF0IDB4YzA0MDgwMDAKPiBXb3JraW5nIEZEVCBzZXQgdG8g
YzA0MDgwMDAKPiAgICAgTG9hZGluZyBEZXZpY2UgVHJlZSB0byBjMDVmODAwMCwgZW5kIGMwNWZm
NzFjIC4uLgo+Cj4gQWRqdXN0IFNUQUNLX1NJWkUgdG8gMTZLQiBmb3IgU1RNMzIgTUNVcyAoRjQv
RjcgYW5kIEg3KSBib2FyZHMKPiB0byBmaXgga2VybmVsIGJvb3QgcHJvY2VzcyBhcyBzb21lIG9m
IHRoZXNlIGJvYXJkcyBlbWJlZHMgYSBsaW1pdGVkCj4gYW1vdW50IG9mIG1lbW9yeS4KPgo+IEZp
eGVzOiA2NTM0ZDI2ZWU5YTUgKCJsbWI6IGRvIGF3YXkgd2l0aCBhcmNoX2xtYl9yZXNlcnZlKCki
KQoKCkkgdGhpbmsgaXQgaXMgYWxzbyBsaW5rZWQgdG8gYW4gb3RoZXIgY29tbWl0CgpGaXhlczo3
NGI4NjliYWU3NGMgKCJlZmlfbG9hZGVyOiB1c2UgQ09ORklHX1NUQUNLX1NJWkUgaW4gdGhlIFVF
Rkkgc3ViLXN5c3RlbSIpCgpiZWZvcmUgdGhlIHBhdGNoIENPTkZJR19TRVRfU1RBQ0tfU0laRSB3
YXMgbm90IGRlZmluZWQgZm9yIEFMTCBBUk0gcGxhdGZvcm0KClNvIENPTkZJR19TVEFDS19TSVpF
IHdhcyBub3QgZGVmaW5lZMKgIC8gYW5kIHdhcyBubyB1c2VkIGluIHBsYXRmb3JtCgooVS1Cb290
IHN0YWNrIHVwIHRvIGVuZCBvZiB0aGUgVS1Cb290IGFyZWEpCgphZnRlciB0aGUgcGF0Y2ggdGhl
IENPTkZJR19TVEFDS19TSVpFaXMgc2V0IGEgMTZNQiBmb3IgYWxsIHBsYXRmb3JtLCAKZXZlbiBp
ZiBFRkkgaXMgbm90IHVzZWQKCgorY29uZmlnIFNUQUNLX1NJWkUKK8KgwqDCoCBoZXggIkRlZmlu
ZSBtYXggc3RhY2sgc2l6ZSB0aGF0IGNhbiBiZSB1c2VkIGJ5IFUtQm9vdCIKCivCoMKgwqAgZGVm
YXVsdCAweDQwMDAwMDAgaWYgQVJDSF9WRVJTQUwgfHwgQVJDSF9aWU5RTVAKK8KgwqDCoCBkZWZh
dWx0IDB4MjAwMDAwIGlmIE1JQ1JPQkxBWkUKK8KgwqDCoCBkZWZhdWx0IDB4MTAwMDAwMAoKCjE2
TUIgaXMgbmVlZGVkIE9OTFkgZm9yIEVGSSBsb2FkZXIgY2FzZXMsIGZvciBvdGhlciBwbGF0Zm9y
bSB0aGF0IHNlZW1zIApodWdlLgoKCkBIZWlucmljaDogZG8geW91IHRoaW5rIHlvdSBjYW4gYWRk
IHRoaXMgY29uZGl0aW9uIENPTkZJR19FRklfTE9BREVSIHRvIAphdm9pZCBpc3N1ZSBmb3Igb3Ro
ZXIgcGxhdGZvcm1zID0KClNvIHVzZSAxNk1CIChwcmV2aW91c2x5IGhhcmRjb2RlZCBpbiBsaWIv
ZWZpX2xvYWRlci9lZmlfbWVtb3J5LmMgd2l0aCAKYWRkX3VfYm9vdF9hbmRfcnVudGltZSgpICkK
CiDCoMKgwqAgZGVmYXVsdCAweDEwMDAwMDAgaWYgRUZJX0xPQURFUgoKCmFuZCBzbyBmb3JjZSB0
aGUgb3RoZXIgcGxhdGZvcm1zIHRvIGRlZmluZSB0aGUgQ09ORklHX1NUQUNLX1NJWkUgKG5vdyAK
dXNlZCBpbiBMTUIpIHdpdGggYW4gYWRlcXVhdGUgdmFsdWUgPwoKCj4KPiBTaWduZWQtb2ZmLWJ5
OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiAtLS0KPgo+
ICAgS2NvbmZpZyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBk
aWZmIC0tZ2l0IGEvS2NvbmZpZyBiL0tjb25maWcKPiBpbmRleCAxZjViMGYxOTcyZC4uYzA4N2E0
MjBhMjQgMTAwNjQ0Cj4gLS0tIGEvS2NvbmZpZwo+ICsrKyBiL0tjb25maWcKPiBAQCAtNTc4LDYg
KzU3OCw3IEBAIGNvbmZpZyBTVEFDS19TSVpFCj4gICAJaGV4ICJEZWZpbmUgbWF4IHN0YWNrIHNp
emUgdGhhdCBjYW4gYmUgdXNlZCBieSBVLUJvb3QiCj4gICAJZGVmYXVsdCAweDQwMDAwMDAgaWYg
QVJDSF9WRVJTQUxfTkVUIHx8IEFSQ0hfVkVSU0FMIHx8IEFSQ0hfWllOUU1QCj4gICAJZGVmYXVs
dCAweDIwMDAwMCBpZiBNSUNST0JMQVpFCj4gKwlkZWZhdWx0IDB4NDAwMCBpZiBBUkNIX1NUTTMy
Cj4gICAJZGVmYXVsdCAweDEwMDAwMDAKPiAgIAloZWxwCj4gICAJICBEZWZpbmUgTWF4IHN0YWNr
IHNpemUgdGhhdCBjYW4gYmUgdXNlZCBieSBVLUJvb3QuIFRoaXMgdmFsdWUgaXMgdXNlZAoKCkFu
eXdheSBmb3IgdGhpcyBTVE0zMiBNQ1UgcGF0Y2g6CgoKUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+CgpUaGFua3MKUGF0cmljawoKCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0
bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vi
b290LXN0bTMyCg==
