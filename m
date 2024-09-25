Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDFE986619
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Sep 2024 20:04:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67262C78006;
	Wed, 25 Sep 2024 18:04:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B47F5C57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 18:04:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C4B8388BD2;
 Wed, 25 Sep 2024 20:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727287468;
 bh=m6WbO+ucGVEzRZwbM3kRv7BoJcbe/HXzmtCrxCQq8Cw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wvUGwYcsajpzQBGaHEySdVYYSbtJ8XjJBLcTIZu1SFZGbnbiYS8owFGWuMg3iduxZ
 8T6W5N6TdSesvESl8BIl14EAntcBjMz0Th8Xp3KcbyGvpFfdjGPQNe/oFIK8fkgfWq
 hrlkC/9SGKof93xrHTMyRBvWTc1QOv0ALQYX11X++NmLNJO7LyBwhv4Dd6ijLP9m5A
 fE2ZCss2IamTpXCnsRhZNqm8ba9P/FhnHxFC6jFQu6IINj+C3LiUoDQeo6calXIQih
 zMn57kPmPVUo72MTkGcau3pK31jvO/dRvuw+OX6dBNEMNGNGibRfaO0w1NvxEtaA0B
 U/eJvKO5BcKfA==
Message-ID: <7a71a93d-60d6-412b-83b7-a8df244694e4@denx.de>
Date: Wed, 25 Sep 2024 19:59:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de,
 Tom Rini <trini@konsulko.com>
References: <20240618225736.154959-1-marex@denx.de>
 <2fd69224-c299-4b43-9078-07e06cc345f5@foss.st.com>
 <6957bfce-21c5-4996-9e3f-a43f6243fa49@denx.de>
 <6702ce8b-e4ff-45e2-a021-dd0a0d1253db@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6702ce8b-e4ff-45e2-a021-dd0a0d1253db@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Fix TAMP_SMCR BKP..PROT
	fields on STM32MP15xx
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

T24gOS8yNS8yNCA3OjUwIFBNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIE1hcmVrLAoK
SGksCgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDEvc3Rt
MzJtcDE1eC5jIGIvYXJjaC9hcm0vIAo+Pj4+IG1hY2gtc3RtMzJtcC9zdG0zMm1wMS9zdG0zMm1w
MTV4LmMKPj4+PiBpbmRleCBmMDk2ZmU1MzhkOC4uY2EyMDJiZWM4ZWUgMTAwNjQ0Cj4+Pj4gLS0t
IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL3N0bTMybXAxNXguYwo+Pj4+ICsrKyBi
L2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9zdG0zMm1wMTV4LmMKPj4+PiBAQCAtMTQ4
LDggKzE0OCw4IEBAIHN0YXRpYyB2b2lkIHNlY3VyaXR5X2luaXQodm9pZCkKPj4+PiDCoMKgwqDC
oMKgwqAgKi8KPj4+PiDCoMKgwqDCoMKgIGNscnNldGJpdHNfbGUzMihUQU1QX1NNQ1IsCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVEFNUF9TTUNSX0JLUFJXRFBST1QgfCBUQU1QX1NN
Q1JfQktQV0RQUk9ULAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEZJRUxEX1BSRVAoVEFN
UF9TTUNSX0JLUFJXRFBST1QsIDB4MjApIHwKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBG
SUVMRF9QUkVQKFRBTVBfU01DUl9CS1BXRFBST1QsIDB4MjApKTsKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBGSUVMRF9QUkVQKFRBTVBfU01DUl9CS1BSV0RQUk9ULCAweDBBKSB8Cj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRklFTERfUFJFUChUQU1QX1NNQ1JfQktQV0RQUk9ULCAw
eDBGKSk7Cj4+Pj4gwqAgwqDCoMKgwqDCoCAvKiBHUElPWjogZGVhY3RpdmF0ZSB0aGUgc2VjdXJp
dHkgKi8KPj4+PiDCoMKgwqDCoMKgIHdyaXRlbChCSVQoMCksIFJDQ19NUF9BSEI1RU5TRVRSKTsK
Pj4+Cj4+PiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9z
cy5zdC5jb20+Cj4+Cj4+IEkgaG9wZSB0aGlzIGJ1Z2ZpeCB3aWxsIG1ha2UgaXQgaW50byAyMDI0
LjEwICwgY2FuIHlvdSBwcmVwYXJlIGEgCj4+IGJ1Z2ZpeCBQUiBmb3IgMjAyNC4xMCA/Cj4gCj4g
Cj4gVGhhbmtzIGZvciByZW1pbmRlciwgSSBtaXNzIGl0Lgo+IAo+IEFuZCBzb3JyeSBmb3IgdGhl
IGRlbGF5LCBiZWNhdXNlIGEgcHVsbCByZXF1ZXN0IHdhcyBwbGFubmVkIGJ5IFBhdHJpY2UgCj4g
YWZ0ZXIgd2l0aCBzdW1tZXIgaG9saWRheS4uLi4KPiBidXQgdW5mb3J0dW5hdGVseSBpdCBjYW4n
dCBkbyBpdCBub3cgKGhlIGlzIG91dCBvZiB0aGUgb2ZmaWNlIGZvciBhIGZldyAKPiB3ZWVrcyBh
ZnRlciBhIHNtYWxsIGluY2lkZW50KQoKSSBob3BlIHlvdSBoYWQgYSBnb29kIHJlbGF4aW5nIHRp
bWUgPwoKPiBzbyBJIHdpbGwgcHVzaCBhIFBSIHRoaXMgd2VlayB3aXRoIHlvdXIgMiBidWdmaXgg
cGF0Y2hlcy4KVGhhbmsgeW91ICEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
