Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D63FF255
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Sep 2021 19:34:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 860CAC57B53;
	Thu,  2 Sep 2021 17:34:15 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3978C0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Sep 2021 17:34:12 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 k20-20020a4ad114000000b0029133123994so770532oor.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Sep 2021 10:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oxSS+SR3+SRUB+2mh/zMto3cY6UwiZYiaotk2pKf9H4=;
 b=jGCZ7fkRklolzXYqYwRgtemEZalDKLMBBqjVoWcDriyiRxRZ7pF3wgvkr01jM+kjk/
 hOkcdy12jy3beQX/reEpp13PrrzQBIZqvW5RkMo7fYfqlrAdLul9zC2dMIvWmKTu2kD6
 dsZrlE2pyoSaeqArohDjte5MjCjOY8ZCrIyNOnBOYjKEQRrYKyjRpeft7SLQYQThQgwC
 kR9X/Il2GLGMA6oF6ca6vKaGMBVJGhPgQN/5EyzPxp/vF+WcvwfhYgdIYIuR4KaSoOxN
 C64Blh1hCO9/leNpmDPlJpf5hBDwQM/kWsJPTJ1D/p9f/gYrPfuamFMR52U/ndMFieqx
 UQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oxSS+SR3+SRUB+2mh/zMto3cY6UwiZYiaotk2pKf9H4=;
 b=E/Vpy1pjZ7DByWyJPcRyX7SgkAoYX0QmQBYW+XbKIPRFhhbEaqzSZvLxtSXgPIxzKb
 1z0dWUpvSh4Q6MgsYwYcmSHClZjw1RDtk1o3NMPTwI0OrAj57DIAiIGlPWlK2m/B1jDF
 ZjNtXboVjQlHDrQFiAcWVgr64dS7j1IiuR0LuyvzTvwm98Sh8K4uAORzhm5LNfEEtjpq
 9oYTqC2JB2iBmgKUsmiJaCaH9B/Dkg9lMMBjLrqZccuKSvsOLy1knGuT5rGykGPrGno+
 r0uYk+P4Da7BQzPFMNOCLDsUQS83HxZSz775AlewjRcHD99PHHJkKXLWNek1UFz9okrx
 p/rw==
X-Gm-Message-State: AOAM531Kol3ZfmSTQkIGZ/ZT26FgMqYi/uIj2tT84LLtakKdY0Q5j4h4
 6p5opmZTFPHD9EDEkjkCkGQ=
X-Google-Smtp-Source: ABdhPJytHCcU7MuJJtC/eM7OdjPGxeiZ/cAbeCbizs3wLj+QSLIiJeH4LiarB8XGqJfr0KhNpi3OFg==
X-Received: by 2002:a4a:a8c9:: with SMTP id r9mr3506038oom.49.1630604051749;
 Thu, 02 Sep 2021 10:34:11 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id i5sm466455oie.11.2021.09.02.10.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 10:34:11 -0700 (PDT)
From: "Alex G." <mr.nuke.me@gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210826214209.254461-1-mr.nuke.me@gmail.com>
 <20210826214209.254461-11-mr.nuke.me@gmail.com>
 <1afb6206-e2e9-30e7-33f5-695341e88841@foss.st.com>
 <0d056c73-60ad-2590-a355-1aff7a8af73d@gmail.com>
Message-ID: <62cc5865-dd38-1cd0-de84-21874144a95b@gmail.com>
Date: Thu, 2 Sep 2021 12:34:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0d056c73-60ad-2590-a355-1aff7a8af73d@gmail.com>
Content-Language: en-US
Cc: marex@denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 10/10] stm32mp1: spl: Copy optee nodes to
 target FDT for OP-TEE payloads
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

SGkgUGF0cmljaywKCk9uIDkvMS8yMSAxMDoxMCBBTSwgQWxleCBHLiB3cm90ZToKPiBIaSBQYXRy
aWNrLAo+IAo+IE9uIDgvMzEvMjEgMTI6MjQgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+
IEhpLAo+Pgo+PiBPbiA4LzI2LzIxIDExOjQyIFBNLCBBbGV4YW5kcnUgR2Fnbml1YyB3cm90ZToK
Pj4+IE9QLVRFRSBkb2VzIG5vdCB0YWtlIGEgZGV2aWNldHJlZSBmb3IgaXRzIG93biB1c2UuIEhv
d2V2ZXIsIGl0IGRvZXMKPj4+IHBhc3MgdGhlIGRldmljZXRyZWUgdG8gdGhlIG5vcm1hbCB3b3Js
ZCBPUy4gSW4gbW9zdCBjYXNlcyB0aGF0IHdpbGwKPj4+IGJlIHNvbWUgb3RoZXIgZGV2aWNldHJl
ZS1iZWFyaW5nIHBsYXRmb3JtLCBzdWNoIGFzIGxpbnV4Lgo+Pj4KPj4+IEFzIGluIG90aGVyIGNh
c2VzIHdoZXJlIHRoZXJlJ3MgYW4gT1BURUUgcGF5bG9hZCAoZS5nLiBCT09UTV9PUFRFRSksCj4+
PiBpdCBpcyByZXF1aXJlZCB0byBjb3B5IHRoZSBvcHRlZSBub2RlcyB0byBoZSB0YXJnZXQncyBG
RFQuIERvIHRoaXMgYXMKPj4+IHBhcnQgb2Ygc3BsX2JvYXJkX3ByZXBhcmVfZm9yX29wdGVlKCku
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEdhZ25pdWMgPG1yLm51a2UubWVAZ21h
aWwuY29tPgo+Pj4gLS0tCj4+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3BsLmMgfCAyICsr
Cj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zcGwuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9z
cGwuYwo+Pj4gaW5kZXggZDlmZGM1OTI2Yy4uOTRmYmI0NWNmOSAxMDA2NDQKPj4+IC0tLSBhL2Fy
Y2gvYXJtL21hY2gtc3RtMzJtcC9zcGwuYwo+Pj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L3NwbC5jCj4+PiBAQCAtMTksNiArMTksNyBAQAo+Pj4gwqAgI2luY2x1ZGUgPGFzbS9hcmNoL3N5
c19wcm90by5oPgo+Pj4gwqAgI2luY2x1ZGUgPG1hY2gvdHpjLmg+Cj4+PiDCoCAjaW5jbHVkZSA8
bGludXgvbGliZmR0Lmg+Cj4+PiArI2luY2x1ZGUgPHRlZS9vcHRlZS5oPgo+Pj4gwqAgdTMyIHNw
bF9ib290X2RldmljZSh2b2lkKQo+Pj4gwqAgewo+Pj4gQEAgLTE4Miw2ICsxODMsNyBAQCB2b2lk
IHN0bTMyX2luaXRfdHpjX2Zvcl9vcHRlZSh2b2lkKQo+Pj4gwqAgdm9pZCBzcGxfYm9hcmRfcHJl
cGFyZV9mb3Jfb3B0ZWUodm9pZCAqZmR0KQo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCBzdG0zMl9m
ZHRfc2V0dXBfbWFjX2FkZHIoZmR0KTsKPj4+ICvCoMKgwqAgb3B0ZWVfY29weV9mZHRfbm9kZXMo
ZmR0KTsKPj4+IMKgwqDCoMKgwqAgc3RtMzJfaW5pdF90emNfZm9yX29wdGVlKCk7Cj4+PiDCoCB9
Cj4+Cj4+Cj4+IE5BSyB0aGUgT1AtVEVFIG5vZGVzIGFyZSBBRERFRCBieSB0aGUgT1AtVEVFIGZp
cm13YXJlIGluIHRoZSB1bnNlY3VyZSAKPj4gZGV2aWNlIHRyZWUgKHdoZW4gQ0ZHX0RUIGlzIGFj
dGl2YXRlZCkKPj4KPj4gYmVmb3JlIHRvIGp1bXAgdG8gdGhlIGtlcm5lbCAodGhhdCByZW1vdmUg
dGhlIG5lZWQgdG8gaGF2ZSBEVCAKPj4gYWxsaWduZW1lbnQgd2l0aCBVLUJvb3QgU1BMIGRldmlj
ZSB0cmVlKQo+Pgo+PiA9PiBTUEwgc2hvdWxkIG5vdCBjb3B5IHRoZSBPUC1URUUgbm9kZXMgaW4g
bmV4dCBzdGFnZSBEVAo+Pgo+PiByZWZlcmVuY2UgaW4gb3B0ZWVfb3MgPSBjb3JlL2FyY2gvYXJt
L2tlcm5lbC9ib290LmM6IGFkZF9vcHRlZV9kdF9ub2RlKCkKPj4KPj4gYWRkX29wdGVlX2R0X25v
ZGUoKSA8PSB1cGRhdGVfZXh0ZXJuYWxfZHQoKSA8PSBwYWdlZF9pbml0X3ByaW1hcnkoKQo+Pgo+
PiBJdCBpcyB0aGUgZXhwZWN0ZWQgY29uZmlndXJhdGlvbiBmb3IgT1AtVEVFIG9uIFNUTTMyTVAx
NSBwbGF0Zm9ybS4KPiAKPiBJIGFncmVlIHRoYXQgaWYgYSBjb21wb25lbnQgbW9kaWZpZXMgdGhl
IHBsYXRmb3JtLCBpdCBzaG91bGQgYmUgCj4gcmVzcG9uc2libGUgZm9yIHVwZGF0aW5nIHRoZSBk
ZXZpY2V0cmVlLiBUd28gaXNzdWVzIHRob3VnaAo+IAo+IAo+IDEuIENvbnNpc3RlbmN5Cj4gCj4g
VGhlIFNUTTMySU1BR0UgYm9vdCBwYXRoIGV4cGVjdHMgdS1ib290IHRvIGFkZCB0aGUgb3B0ZWUg
bm9kZXMsIHdoaWxlIAo+IHRoZSBGSVAgcGF0aCBleHBlY3RzIE9QLVRFRSB0byBhZGQgdGhlIG5v
ZGVzLiBXaGljaCBvbmUgZG8gd2Ugc3RpY2sgdG8/Cj4gCj4gCj4gMi4gTWVtb3J5IGFjY2Vzcwo+
IAo+IEkgZG9uJ3QgdW5kZXJzdGFuZCBpcyBob3cgT1AtVEVFIHdvdWxkIGdldCBwYXN0IHRoZSBU
WkMuCj4gSWYgd2UgbG9vayBhdCBvcHRlZV9vcyA9PiBwbGF0LTBzdG0zMm1wMS9wbGF0X3R6YzQw
MDoKPiAgwqDCoMKgICJFYXJseSBib290IHN0YWdlIGlzIGluIGNoYXJnZSBvZiBjb25maWd1cmlu
ZyBtZW1vcnkgcmVnaW9ucyIKPiBUaGUgZm9sbG93aW5nIG1lbW9yeSBoYXMgYmVlbiBzZXQgdXAg
YnkgU1BMIChvciBURi1BIGZvciB0aGF0IG1hdHRlcik6Cj4gCj4gIMKgwqDCoCBOb25zZWM6IGMw
MDAwMDAwLT5kZGZmZmZmZgo+ICDCoMKgwqAgU2VjOsKgwqDCoCBkZTAwMDAwMC0+ZGZkZmZmZmYK
PiAgwqDCoMKgIFNITUVNOsKgIGRmZTAwMDAwLT5kZmZmZmZmZgo+IAo+IFRoZSBleHRlcm5hbCBE
VEIgd2lsbCBiZSBpbiB0aGUgbm9uc2VjIHJlZ2lvbiwgd2hpY2ggT1AtVEVFIGFsbGVnZWRseSAK
PiBjYW4ndCBhY2Nlc3MuIFNvIGhvdyB3b3VsZCB0aGlzIGdldCBwYXRjaGVkPwoKTGV0J3Mgc2V0
IGFzaWRlIHRoZSBhYm92ZSBmb3IgYSBiaXQuIEkgdHJpZWQgdGhlIGZvbGxvd2luZyBPUC1URUUg
Y29uZmlnczoKCgoiQ0ZHX0RUPXkgQ0ZHX0RUQl9NQVhfU0laRT0weDgwMDAwIgoKQ3Jhc2hlcyB3
aXRoICd1bmhhbmRsZWQgcGFnZWFibGUgYWJvcnQnIHNvbWV3aGVyZSBpbiAKY29yZS9hcmNoL2Fy
bS9wbGF0LXN0bTMybXAxLyAuIEkgZG9uJ3QgaGF2ZSBtdWNoIG1vcmUgdGltZSB0byBzcGVuZCAK
ZGVidWdnaW5nIHRoaXMuCgoKIkNGR19EVD15IENGR19EVEJfTUFYX1NJWkU9MHg4MDAwMCBQTEFU
Rk9STV9GTEFWT1I9MTU3Q19ESzIiCgpUaGlzIGFkZHMgYWJvdXQgODAwIG1zIHRvIHRoZSBib290
IHRpbWUuIChwb3dlciBvbiB0byBrZXJuZWwgcHJpbnRpbmcgCnRoZSBmaXJzdCBsaW5lKS4gSSBo
YXZlIGFuIGFsbG93YW5jZSBvZiAxIHNlY29uZCB0byBnZXQgdG8gdGhlIGtlcm5lbC4gSSAKY2Fu
bm90IGp1c3QgYWRkIDgwMG1zIHRvIHRoZSBib290IHRpbWUgYW5kIGhvcGUgbm9ib2R5IG5vdGlj
ZXMuIEhvd2V2ZXIsIApjYWxsaW5nIG9wdGVlX2NvcHlfZmR0X25vZGVzKCkgYWRkcyBubyBtZWFz
dXJlYWJsZSBhbW91bnQgb2YgdGltZS4KClVubGVzcyBPUC1URUUgY2FuIG1vZGlmeSB0aGUgZGV2
aWNldHJlZSB3aXRob3V0IGluY3JlYXNpbmcgYm9vdCB0aW1lLCBJIAp3aWxsIG5vdCBnbyBkb3du
IHRoaXMgcGF0aC4gVGhpcyBpcyBhbiBlbmdpbmVlcmluZyBkZWNpc2lvbiBkcml2ZW4gYnkgCnRo
ZSBwcm9kdWN0IHJlcXVpcmVtZW50cy4KClRoYXQgYmVpbmcgc2FpZCwgSSByZXF1ZXN0IHRoYXQg
eW91IHJlY29uc2lkZXIgeW91ciBOQUsgYmFzZWQgb24gdGhpcyAKbmV3IGRhdGEuCgpBbGV4CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
