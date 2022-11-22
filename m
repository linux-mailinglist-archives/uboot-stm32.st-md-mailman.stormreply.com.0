Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF76344CA
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Nov 2022 20:43:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61DD1C5F1ED;
	Tue, 22 Nov 2022 19:43:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11FB4C03FE1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 19:43:48 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id e11so13389050wru.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 11:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MNrrdpvneOfKFb6RlenPGlB0p2q4hw8PEVwomNOjfvM=;
 b=GFN247PFv0Cdb/PukGaf5UuO/815BwsZ/pSx0MWwGCb/T5qh+0T6QTgjEr260hQz6E
 /Ng0eCbukVuNhpyngSTgMxvSGkpYXjtGiXX/6XUOvyOuHEWv+qWqiFxuCpvLdjLZ9o+9
 EUddjdRNZNCUBI/BM3W4TTweWuEccdRNV/fWM3G6ndEZ5B76YCx0CFEpX9TQygUWBPfE
 xWujYmpQoL3X01jJlUYluPnwFLx5ThjjLxZuvnGkykLHhu0H8sb41HCqVC7XRRZ6Ey9r
 2cYkzCYe6ot++wmTmEpW8fL5GGk3r49oYeZPd7pGtCMeIMWL+TALDFdsiEGsmt43SQa7
 3nIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MNrrdpvneOfKFb6RlenPGlB0p2q4hw8PEVwomNOjfvM=;
 b=frhncUZLw/ko7VhzCJ8eM1cMeUiw6OnldW/xjphyxdXEKrW4i3F3bE0uAtNipbunMm
 J++kSo+Fjou0zNvnRPW+b9GXm4BNic7XQfzp4B/MEQ+7qsx694BzP5MHH5MmnGWVRHuv
 /8LBkPlI7BTnOaoV87T3urbllLJpjJrpeT1rFZpT1g+kvW4QWc6nu3gnICSkmj2tIt4S
 49poaA6joRsqdmLRDLdNXj64NiH/opoiAt2W9PcEXpf6rcB9PbJiNW7z13tlAmcU2LHu
 qYTii3b/f6Tb+rqfIZQKrQa+y5x7f/H3m+irrpF036QfOMV5eWGcsp7yqzxKMkkpkr07
 mIoA==
X-Gm-Message-State: ANoB5pmzuYnGLjkDSEzAWqyHOt/v9QNF3zn9CG1UK2VwH85YcKOEORBU
 L4mrzf+f4KhTpbWIxL7OMyudpg==
X-Google-Smtp-Source: AA0mqf75/fzvovTF7aAooGeJgMYfxaCXbPetjcC99ZyuraB8kQqRYCCkO0s9C1XcYYFGarFE1LEuBw==
X-Received: by 2002:a5d:68cd:0:b0:241:d609:9d40 with SMTP id
 p13-20020a5d68cd000000b00241d6099d40mr7174463wrw.305.1669146228562; 
 Tue, 22 Nov 2022 11:43:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0?
 ([2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0])
 by smtp.gmail.com with ESMTPSA id
 iv7-20020a05600c548700b003cf87623c16sm26369583wmb.4.2022.11.22.11.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 11:43:48 -0800 (PST)
Message-ID: <f0dd213c-4a34-926d-3f3b-f2ed49bb92c3@linaro.org>
Date: Tue, 22 Nov 2022 20:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <b7e891d1-d134-b489-eb2d-6125d4c7b6c6@theobroma-systems.com>
 <5f67e057-c41a-d4a0-b199-5840ae771e35@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <5f67e057-c41a-d4a0-b199-5840ae771e35@linaro.org>
Cc: Edoardo Tomelleri <e.tomell@gmail.com>, Peter Hoyes <Peter.Hoyes@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Zhang Ning <zhangn1985@qq.com>, Zhaofeng Li <hello@zhaofeng.li>,
 Ramon Fried <rfried.dev@gmail.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 0/3] cmd: pxe: support INITRD and FDT
	selection with FIT
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjIvMTEvMjAyMiAyMDoxMSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MjEvMTEvMjAyMiAxMzoyMywgUXVlbnRpbiBTY2h1bHogd3JvdGU6Cj4+IEhpIFBhdHJpY2ssCj4+
Cj4+IFRoYW5rcyBmb3IgbG9va2luZyBhdCBpdC4KPj4KPj4gT24gMTAvMjgvMjIgMTE6MDEsIFBh
dHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+Pgo+Pj4gU2luY2UgdGhlIGNvbW1pdCBkNWJhNjE4OGRm
YmYgKCJjbWQ6IHB4ZV91dGlsczogQ2hlY2sgZmR0Y29udHJvbGFkZHIKPj4+IGluIGxhYmVsX2Jv
b3QiKSB0aGUgRkRUIG9yIHRoZSBGRFRESVIgbGFiZWwgaXMgcmVxdWlyZWQgaW4gZXh0bGludXgu
Y29uZgo+Pj4gYW5kIHRoZSBmYWxsYmFjayBkb25lIGJ5IGJvb3RtIGNvbW1hbmQgd2hlbiBvbmx5
IHRoZSBkZXZpY2UgdHJlZSBpcyBwcmVzZW50Cj4+PiBpbiB0aGlzIGNvbW1hbmQgcGFyYW1ldGVy
cyBpcyBubyBtb3JlIHBlcmZvcm1lZCB3aGVuIEZJVCBpcyB1c2VkIGZvcgo+Pj4ga2VybmVsLgo+
Pj4KPj4+IFRoZSBuZXh0IGZpbGUgImV4dGxpbnV4LmNvbmYiIG5vIG1vcmUgc2VsZWN0cyB0aGUg
ZGV2aWNlIHRyZWUgaW4gRklUCj4+PiBidXQgdXNlIHRoZSBweGUgZmFsbGJhY2sgd2l0aCB0aGUg
ZGV2aWNlIHRyZWUgb2YgVS1Cb290Lgo+Pj4KPj4+IG1lbnUgdGl0bGUgU2VsZWN0IHRoZSBib290
IG1vZGUKPj4+IERFRkFVTFQgdGVzdAo+Pj4gTEFCRUwgdGVzdAo+Pj4gwqDCoMKgwqDCoMKgwqDC
oCBLRVJORUwgL2ZpdEltYWdlCj4+Pgo+Pj4gVGhpcyBzZXJpZSByZXN0b3JlcyB0aGUgcG9zc2li
aWxpdHkgdG8gdXNlIGEgRklUIGluIGV4dGxpbnV4LmNvbmYKPj4+IGJ5IHVzaW5nIEZEVCBsYWJl
bCB3aXRoIHRoZSBzYW1lIHN0cmluZy4KPj4+Cj4+PiBtZW51IHRpdGxlIFNlbGVjdCB0aGUgYm9v
dCBtb2RlCj4+PiBERUZBVUxUIHRlc3QKPj4+IExBQkVMIHRlc3QKPj4+IMKgwqDCoMKgwqDCoMKg
wqAgS0VSTkVMIC9maXRJbWFnZQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBGRFQgL2ZpdEltYWdlCj4+
Pgo+Pj4gZXZlbiB3aGVuIGEgc3BlY2lmaWMgRklUIGNvbmZpZyBpcyB1c2VkOgo+Pj4KPj4+IG1l
bnUgdGl0bGUgU2VsZWN0IHRoZSBib290IG1vZGUKPj4+IERFRkFVTFQgdGVzdAo+Pj4gTEFCRUwg
dGVzdAo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBLRVJORUwgL2ZpdEltYWdlI2NvbmZpZwo+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBGRFQgL2ZpdEltYWdlI2NvbmZpZwo+Pj4KPj4+IFRoZSBsYXN0IGNvbW1p
dCBvZiB0aGUgc2VyaWVzIGlzIG9ubHkgYSBtaW5vciBpbXByb3ZlbWVudC4KPj4+Cj4+Cj4+IEkg
dGVzdGVkIHRoaXMgb24gbXkgUHVtYSBSSzMzOTkgYW5kIGl0IGRvZXMgd29yayBhZ2FpbiwgdGhh
bmtzLgo+Pgo+PiBIb3dldmVyLCBJJ20gbm90IHN1cmUgdGhpcyBpcyB3aGF0IHdlIHNob3VsZCBn
byBmb3I/Cj4+Cj4+IE15IHdvcnJ5IGlzIHRoZSBmb2xsb3dpbmc6Cj4+IFdoYXQgaGFwcGVucyBm
b3Igb2xkIHJlbGVhc2VzIChwcmUtdjIwMjIuMDQpIHdoZXJlIEtFUk5FTCB3b3JrZWQganVzdCBm
aW5lIHdpdGhvdXQgdGhlIEZEVCB0byBsb2FkIHRoZSBmZHQgZnJvbSB0aGUgZml0aW1hZ2UgY29u
ZiBzcGVjaWZpZWQgaW4gS0VSTkVMIGZpZWxkPyBXb3VsZCB3ZSBub3cgbmVlZCB0byBrZWVwIGFu
IGV4dGxpbnV4LmNvbmYgZm9yIHByZS0yMDIyLjA0IHJlbGVhc2VzIHdoZXJlIEZEVCB3b3VsZG4n
dCBiZSBzZXQgYW5kIG9uZSBmb3IgMjAyMy4wMSBhbmQgbGF0ZXIgd2hlcmUgRkRUIHdvdWxkIGJl
IG1lbnRpb25lZD8gVGhhdCBkb2VzIG5vdCBzZWVtIGxpa2UgYSBnb29kIHRoaW5nIGZvciBkaXN0
cm9zLgo+Pgo+PiBJIHVuZm9ydHVuYXRlbHkgY2Fubm90IGFuc3dlciB0aGUgcXVlc3Rpb24gbXlz
ZWxmIHdpdGhvdXQgc3BlbmRpbmcgc2lnbmlmaWNhbnQgZWZmb3J0IHBhdGNoaW5nIHYyMDIyLjAx
IHRvIGdldCBpdCB0byB3b3JrIG9uIG91ciBQdW1hIG1vZHVsZS4gRG9lcyBhbnlvbmUgaGF2ZSBh
Y2Nlc3MgdG8gYSBib2FyZCB0byBxdWlja2x5IGNoZWNrIGFuIGV4dGxpbnV4LmNvbmYgd2l0aCBL
RVJORUwgYW5kIEZEVCBzZXQgdG8gL2ZpdEltYWdlIG9uIGEgdjIwMjIuMDEgcmVsZWFzZT8KPiAK
PiBJJ20gYnVpbGRpbmcga2lya3N0b25lIGltYWdlcyB3aXRoIG1ldGEtbWVzb24gaGF2aW5nIHYy
MDIyLjAxLCBJJ2xsIHRlc3Qgd2l0aCBGRFQgc2V0IHRvIC9maXRJbWFnZSB0byBzZWUgaWYgaXQg
YnJlYWtzLgoKSXQgYnJlYWtzOgpGb3VuZCAvZXh0bGludXgvZXh0bGludXguY29uZgpSZXRyaWV2
aW5nIGZpbGU6IC9leHRsaW51eC9leHRsaW51eC5jb25mCjE6CVlvY3RvClJldHJpZXZpbmcgZmls
ZTogL2ZpdEltYWdlCmFwcGVuZDogcm9vdD1QQVJUVVVJRD0zZWJjMDAwNS0wMiByb290d2FpdCBj
b25zb2xlPXR0eUFNTDAsMTE1MjAwClJldHJpZXZpbmcgZmlsZTogL2ZpdEltYWdlCkJhZCBMaW51
eCBBUk02NCBJbWFnZSBtYWdpYyEKU0NSSVBUIEZBSUxFRDogY29udGludWluZy4uLgoKPiAKPiBO
ZWlsCj4gCj4+Cj4+IElzIHRoZXJlIHJlYWxseSBubyBvdGhlciB3YXkgdGhhbiBhZGRpbmcgdGhp
cyBuZXcgcmVxdWlyZW1lbnQ/IChOb3RoaW5nIGFnYWluc3QgaXQgaWYgaXQgZG9lcyBub3QgYnJl
YWsgb2xkZXIgcmVsZWFzZXMgd2l0aCB0aGUgIm5ldyIgZXh0bGludXguY29uZiB0aG91Z2gpLgo+
Pgo+PiBDaGVlcnMsCj4+IFF1ZW50aW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
