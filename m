Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC348A7D57
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Apr 2024 09:45:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9394C6B444;
	Wed, 17 Apr 2024 07:45:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EC29C69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 07:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713339909; x=1713944709; i=xypron.glpk@gmx.de;
 bh=gEyRWWixr+SHgKPsBYP6F3HIVvpo2AX8oSaqrvYoigk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=UwS08BEsEScx6oU/13mLzSaZwVTzWM1qLvSjJ9OeZWrO9S5iFmrX3EB7vTS+635s
 PnDSahuPE4sgMHuYrecYqCcVUXpHNnQt2qARFMjuHwycjX7KbRS/y9NKLuSTi+jIh
 t9MoSpvffXN2JOgN5Vj945iwYuNc30qmmvdQQwhxBuwuFSCP3/F8yAjVwBpzAid0s
 roLOVQ4F7Flr6VaoLlYl+NJ3j3g6359XQgiFS0Ke6xtP7pDx35sGB6xiSj6s5CNXQ
 vThIxg6G7yF2Q5fpWkPzDEEGs3LoLl2wZgI7dUEejr38AxZluF20lSUG9yNElvBoW
 gIIRyiwuUCrphn4JtA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.126] ([62.143.245.32]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2nK-1sa8AB2ebi-00n696; Wed, 17
 Apr 2024 09:45:09 +0200
Message-ID: <24c03e51-90f8-4918-8097-2a6ccd6ebf4e@gmx.de>
Date: Wed, 17 Apr 2024 09:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
References: <20240308101230.2595220-1-patrice.chotard@foss.st.com>
 <3512e31e-37db-4e03-b133-1914e29fa7ad@foss.st.com>
Content-Language: en-US
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <3512e31e-37db-4e03-b133-1914e29fa7ad@foss.st.com>
X-Provags-ID: V03:K1:bhugLlrRkQeT3PjK8NIs5kzseL03riWHWLW/59BSfYixL67metj
 5ZHL/T5HF1os3cH0tnBbA8LS7yfPH6BkTuekEdRHITyZNUyJkAJSduvy7dOD0tnafK7mjb8
 I4oJvzYq8mXHXFpnr3NevAe5weKrIkgzE7XDEiEsX9oJdtI+6nDYb8I/mZj6D/am/V4yfJM
 7DZyQZr/QwEex18IFdlug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YoEKvjLONCI=;vhmGq215kNaebWaqxAPFaxWn7TD
 50lKcpoYrwNVP+HpqftU30SFYErKDMZ8kxyWh+3BepJDqF/84aNwSWo9nZoVMnAwqDYfIkKzP
 xjiPpg8r+zeALD0LeyEPwLnmveylRDr0BhRbPnXnoupN4Tgao3fS3l1GNn88TZfsXOq1QO87y
 cBwgWt5V/ue/YJthcK/4A7qpJO3Hc1tHHajn+CCnEhJuGZIb4ZL5N2JAlJNgtxdzMTp7SCdah
 A4B7ka1RObIhmQTu3Q8jXIqXt7GYF9mJTsnJ4N4uyEm2F+ngTX/Q2tLFp8om/VEAaubTxxyiU
 k9newgYMeQWOCSUCi+QWZkyB07GMSsal1Ec7vx04e97fuYZ8irAfqMcjv87DBmpvpqKTHiLU5
 KzlHCBBYm4gZbrchunKawC1TIJOInNO6mib+lrR/1L5IwCoDgoqUVKrSGH6gsMSf1f9ItiG6E
 7qp65zWfDSEeMfy1QoktSJW8K7iEJd84pYq0UXKDXIeaThSiiWPE8m4IvWrCf/5f0l0V1XS0I
 fblw2StW3xLZJK5oolCMPRTWhV+/QNuotj8Y2QtXFi72wvz1St7nOKxEgwpnOG5/3dpZ3OTcj
 8hGOYUAcDhP34fJ9k1+0lsoP+CChKLPeDATdOtqYhXK5VgwmsByigq6l91rc7QxxYXR3vUVhd
 v64QK1TSjWoCjj6kAXG80+xiD2UwfEd8X5p2FmvAL9iLJSB6tPt5pY+BZfjKP2CRDVRTeQrZ2
 t/JsjiL1TURJA3lCCzVmnU9RRrklo0yeQG8xFs8dB6nOvvT2ELejsEZ4jo/l1K9vhwcoEMyUi
 Bb1vauE8xlYXmNnBaPqc3RY0ZCcoABKr282K3HRzZJH0g=
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: Reserve OPTEE area in EFI memory
	map
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

T24gMTcuMDQuMjQgMDk6MjUsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4KPiBPbiAz
LzgvMjQgMTE6MTIsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gU2luY2UgY29tbWl0IDdiNzhk
NjQzOGEyYjMgKCJlZmlfbG9hZGVyOiBSZXNlcnZlIHVuYWNjZXNzaWJsZSBtZW1vcnkiKQo+PiBt
ZW1vcnkgcmVnaW9uIGFib3ZlIHJhbV90b3AgaXMgdGFnZ2VkIGluIEVGSSBtZW1vcnkgbWFwIGFz
Cj4+IEVGSV9CT09UX1NFUlZJQ0VTX0RBVEEuCj4+IEluIGNhc2Ugb2YgU1RNMzJNUDEgcGxhdGZv
cm0sIGFib3ZlIHJhbV90b3AsIHRoZXJlIGlzIG9uZSByZXNlcnZlZC1tZW1vcnkKPj4gcmVnaW9u
IHRhZ2dlZCAibm8tbWFwIiBkZWRpY2F0ZWQgdG8gT1AtVEVFIChhZGRyPWRlMDAwMDAwIHNpemU9
MjAwMDAwMCkuCj4+Cj4+IEJlZm9yZSBib290aW5nIGtlcm5lbCwgRUZJIG1lbW9yeSBtYXAgaXMg
Zmlyc3QgYnVpbHQsIHRoZSBPUFRFRSByZWdpb24gaXMKPj4gdGFnZ2VkIGFzIEVGSV9CT09UX1NF
UlZJQ0VTX0RBVEEgYW5kIHdoZW4gcmVzZXJ2aW5nIExNQiwgdGhlIHRhZyBMTUJfTk9ORQo+PiBp
cyB1c2VkLgo+Pgo+PiBUaGVuIGFmdGVyLCB0aGUgTE1CIGFyZSBjb21wbGV0ZWQgYnkgYm9vdF9m
ZHRfYWRkX21lbV9yc3ZfcmVnaW9ucygpCj4+IHdoaWNoIHRyeSB0byBhZGQgYWdhaW4gdGhlIHNh
bWUgT1BURUUgcmVnaW9uIChhZGRyPWRlMDAwMDAwIHNpemU9MjAwMDAwMCkKPj4gYnV0IG5vdyB3
aXRoIExNQl9OT01BUCB0YWcgd2hpY2ggcHJvZHVjZXMgdGhlIGZvbGxvd2luZyBlcnJvciBtZXNz
YWdlIDoKPj4KPj4gIkVSUk9SOiByZXNlcnZpbmcgZmR0IG1lbW9yeSByZWdpb24gZmFpbGVkIChh
ZGRyPWRlMDAwMDAwIHNpemU9MjAwMDAwMAo+PiBmbGFncz00KSIKPj4KPj4gVG8gYXZvaWQgdGhp
cywgT1BURUUgYXJlYSBzaG91bGRuJ3QgYmUgdXNlZCBieSBFRkksIHNvIHdlIG5lZWQgdG8gbWFy
awo+PiBpdCBhcyByZXNlcnZlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJk
IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9t
YWNoLXN0bTMybXAvZHJhbV9pbml0LmMgfCAxMiArKysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gt
c3RtMzJtcC9kcmFtX2luaXQuYwo+PiBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9kcmFtX2luaXQu
Ywo+PiBpbmRleCBmYjEyMDhmYzVkNS4uZjY3ZjU0ZjJhZTAgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
YXJtL21hY2gtc3RtMzJtcC9kcmFtX2luaXQuYwo+PiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMy
bXAvZHJhbV9pbml0LmMKPj4gQEAgLTcsNiArNyw3IEBACj4+IMKgICNpbmNsdWRlIDxjb21tb24u
aD4KPj4gwqAgI2luY2x1ZGUgPGRtLmg+Cj4+ICsjaW5jbHVkZSA8ZWZpX2xvYWRlci5oPgo+PiDC
oCAjaW5jbHVkZSA8aW1hZ2UuaD4KPj4gwqAgI2luY2x1ZGUgPGluaXQuaD4KPj4gwqAgI2luY2x1
ZGUgPGxtYi5oPgo+PiBAQCAtNzUsMyArNzYsMTQgQEAgcGh5c19hZGRyX3QgYm9hcmRfZ2V0X3Vz
YWJsZV9yYW1fdG9wKHBoeXNfc2l6ZV90Cj4+IHRvdGFsX3NpemUpCj4+IMKgwqDCoMKgwqAgcmV0
dXJuIHJlZyArIHNpemU7Cj4+IMKgIH0KPj4gKwo+PiArdm9pZCBlZmlfYWRkX2tub3duX21lbW9y
eSh2b2lkKQo+PiArewo+PiArwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19FRklfTE9BREVS
KSkKPj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogTWVtb3J5IG92
ZXIgcmFtX3RvcCBpcyByZXNlcnZlZCB0byBPUFRFRS4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBE
ZWNsYXJlIHRvIEVGSSBvbmx5IG1lbW9yeSBhcmVhIGJlbG93IHJhbV90b3AKPj4gK8KgwqDCoMKg
wqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGVmaV9hZGRfbWVtb3J5X21hcChnZC0+cmFt
X2Jhc2UsIGdkLT5yYW1fdG9wIC0gZ2QtPnJhbV9iYXNlLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEVGSV9DT05WRU5USU9OQUxfTUVNT1JZKTsKCldpdGggdGhpcyBj
aGFuZ2UgdGhlIEVGSSBtZW1vcnkgbWFwIHBhc3NlZCB0byB0aGUgb3BlcmF0aW5nIHN5c3RlbSB3
aWxsCm5vdCBjb250YWluIGFueSBtZW1vcnkgYWJvdmUgZ2QtPnJhbV90b3AuIElzIHRoaXMgcmVh
bGx5IHlvdXIgaW50ZW50PwpEb24ndCB5b3UgaGF2ZSBhbnkgbWVtb3J5IGFib3ZlIDB4ZTAwMDAw
MDA/CgpCZXN0IHJlZ2FyZHMKCkhlaW5yaWNoCgo+PiArfQo+Cj4KPgo+IFJldmlld2VkLWJ5OiBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+Cj4gVGhhbmtz
Cj4gUGF0cmljawo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
