Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7599700997
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 May 2023 15:56:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 836ACC6904E;
	Fri, 12 May 2023 13:56:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C3DFC65E60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 May 2023 13:56:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 77340809A5;
 Fri, 12 May 2023 15:55:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683899759;
 bh=/RlOjakGE8OifjOty4x1JojjtszzdtpGORiO8yQ37S0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XX5Inju3lgvpwiDiWAfNWeK3PxIv1ATMIPbwfLnXFz0BOQYQRlFuWarpMDOo3GfcT
 MGOtpwHxn2UhShti9TMR0zfGk5sJ9qpB3h0DZq0OQRLt2SJJw1Tj5JYM1p5BXG+GBU
 Oe1ueg0VhgROwc3peIwMW5AwdAaGl8ysV0mygSWIIYGTiGCMwwls0BEq+dP8Z6x6ok
 P+haf66vok1bbYj5a0PDr/E6Avcq91q8k+KNLCl50ILASLVOM/ZoCwlVIayrCGgrs1
 yGHCtOiFUEl6b95bWnQDTJyvovgsswRgjFZXlRpoFYSoSZG4EMzIsf9IjR6CwEVDjG
 bGpg4iRJsNmUg==
Message-ID: <0ee4f382-4c6e-0209-3db9-83d44219c710@denx.de>
Date: Fri, 12 May 2023 15:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20230511002206.180116-1-marex@denx.de>
 <f30a7447-89e3-c3b3-3b8a-3ff048d0695b@foss.st.com>
 <0a44a562-fe18-c8a5-393a-a526be3ca42d@denx.de>
 <a850167d-bdb1-4b05-0d90-4bc6d5303d8f@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <a850167d-bdb1-4b05-0d90-4bc6d5303d8f@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add IWDG handling into PSCI
	suspend code
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

T24gNS8xMi8yMyAxNTo0MywgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKCkhpLAoKPj4+
PiArwqDCoMKgwqDCoMKgwqAgLyogUGluZyBJV0RHMiBhbmQgQUNLIHByZXRpbWVyIElSUSAqLwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoaXdkZzJfd2FrZSkgewo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHdyaXRlbChJV0RHX0tSX1JFTE9BRF9LRVksIFNUTTMyX0lXREcyX0JBU0UgKyBJ
V0RHX0tSKTsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZWwoSVdER19FV0NSX0VX
SUMsIFNUTTMyX0lXREcyX0JBU0UgKyBJV0RHX0VXQ1IpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9
Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gwqAgwqDCoMKgwqDCoCB3cml0ZWwoMHgzLCBTVE0zMl9SQ0Nf
QkFTRSArIFJDQ19NUF9TUkVRQ0xSUik7Cj4+Pj4gwqDCoMKgwqDCoCBkZHJfc3dfc2VsZl9yZWZy
ZXNoX2V4aXQoKTsKPj4+Cj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pgo+PiBJIGZlZWwgbGlrZSBtYXliZSBJIG5lZWQg
dG8gd2hhY2sgdGhlIElXREcgYWxzbyBCRUZPUkUgZW50ZXJpbmcgCj4+IHN1c3BlbmQsIGV4cGVj
dCBhIFYyIHNob3J0bHkuCj4+Cj4+IERvIHlvdSB0aGluayB0aGlzIElXREcgYXBwcm9hY2ggaXMg
ZmluZSB0byBrZWVwIHRoZSBzeXN0ZW0gZnJvbSAKPj4gcmVib290aW5nIGluIHN1c3BlbmQgPyBP
ciBkbyB5b3Ugc2VlIGFueSBiZXR0ZXIgb3B0aW9uIGZvciB0aGUgTVAxID8KPiAKPiAKPiBJIHRo
aW5rIGl0IGlzIGZpbmUgaWYgeW91IHdhbnQgdG8gaGF2ZSB3YXRjaGRvZyBydW5uaW5nIGluIFNU
QU5EQlkgZXZlbiAKPiB0aGlzIHBhdGNoIGZvcmNlIGEgd2FrZXVwLgo+IAo+IGJ1dCBpZiBJV0RH
IDEgb3IgMiBzaG91bGQgYmUgbm90IHJ1bm5pbmcgaW4gU1RBTkRCWSAoYnV0IGFsc28gZm9yIFNU
T1ApIAo+IGZvciB5b3VyIHByb2R1Y3QsCgpXaHkgPwoKSSB3YW50IHRoZSB3YXRjaGRvZyB0byBt
b25pdG9yIHRoYXQgdGhlIHBsYXRmb3JtIGlzIHN0aWxsIE9LLCBldmVuIGluIApzdXNwZW5kLiBB
bHNvLCBhcyBmYXIgYXMgSSBjYW4gdGVsbCwgb25jZSB0aGUgSVdERyBpcyBzdGFydGVkLCBpdCBj
YW5ub3QgCmJlIHN0b3BwZWQsIHJpZ2h0ID8KCj4gaXQgY2FuIGJlIG1hbmFnZWQgZGlyZWN0bHkg
YnkgdGhlIGhhcmR3YXJlIHdpdGggT1RQLCB0byBmcmVlemUgd2F0Y2hkb2cuCj4gCj4gPT4gaXQg
aXMgYSBkZWNpc2lvbiBmb3IgZWFjaCBwcm9kdWN0IG9mIHRoZSBkZXNpcmVkIGJlaGF2aW9yIG9m
IHRoZSBJV0RHIAo+IGluIGxvdyBwb3dlciBtb2RlLgo+IAo+IAo+IFNlZSBSZWYgTWFudWFsOiA0
OC4zIElXREcgaW1wbGVtZW50YXRpb24KPiAKPiBUYWJsZSAzMzIuIFNUTTMyTVAxNTd4IElXREcg
ZmVhdHVyZXMKPiAKPiBPcHRpb24gYnl0ZXMgdG8gY29udHJvbCB0aGUgYWN0aXZpdHkgaW4gU3Rh
bmRieSBtb2RlICg2KQo+IAo+IDYuIENvbnRyb2xsZWQgdmlhIG9wdGlvbiBieXRlcyBPVFBfSVdE
RzFfRlpfU1RBTkRCWSBhbmQgCj4gT1RQX0lXREcyX0ZaX1NUQU5EQlksIHJlc3BlY3RpdmVseSwg
Zm9yIElXREcxIGFuZCBJV0RHMi4KPiAKPiBhbmQgaW7CoFRhYmxlMTcgPT4gT1RQIDE4ID0gSFcy
IGJpdCA1IHRvIDgKCkkgc2F3IHRoZSBPVFAgZnVzZXMsIGJ1dCBJIGRvbid0IHdhbnQgdG8gYmxv
dyB0aGVtLiBPciBpcyB0aGF0IHJlYWxseSAKdGhlIHN1Z2dlc3Rpb24gU1Qgd291bGQgcHJvdmlk
ZSBmb3Igc3VzcGVuZC9yZXN1bWUsIGJsb3cgdGhlIGZ1c2VzID8KCihJIHdvbmRlciwgd2h5IGlz
bid0IHRoZSBsb2dpYyBvZiB0aG9zZSBmdXNlcyBpbnZlcnRlZCB0aGVuLCBpLmUuIGJ5IApkZWZh
dWx0IHN0b3AgdGhlIHdhdGNoZG9nIGluIHN1c3BlbmQgQU5EIGJsb3cgZnVzZXMgdG8ga2VlcCBp
dCBydW5uaW5nIAppbiBzdXNwZW5kPykKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
