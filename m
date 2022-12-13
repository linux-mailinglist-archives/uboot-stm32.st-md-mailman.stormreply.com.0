Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEBE64B774
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Dec 2022 15:34:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DBEEC65E61;
	Tue, 13 Dec 2022 14:34:53 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E524CC03FC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 14:34:51 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w15so15797897wrl.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 06:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=8EH4Cq0oSj2P5puVFPWxW0PI69qwrvFtojUNtz7/n04=;
 b=iUpXLVDAwTW4fCWmFWJckB/9/eOj7OeY3ZpdkBV5gmuW+mr+hHO3Az92shzoU0JxF0
 IqPttwWsM0Ao5PrK4fgL38gfIdA7bhWMIjLHrgGY5oY6x9Nd1Ml9Xe7LJ52VOpmng3tD
 JGLpdtzMUyMk8UP0etUpiMoP+UZg09aq68BZnc0aqJey9L9eliP+56RTywzJKnRoCSxh
 9tTnW9AN+X9ts78J/0tgz0bLUiqvxWNpGRyKLIptL0L1ivorgjKplZjor4ek1ChRjUZ8
 GOolhXdik2YyC6Hr6bPGhBx7y7llsPsFqnhefQ6hvug0hNtSZNewQYiat1t1Sr1FFjei
 G3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8EH4Cq0oSj2P5puVFPWxW0PI69qwrvFtojUNtz7/n04=;
 b=TyxuSo2SoEU5EHAXKGQuU3DK2Fj8ca65HvW4azSwpGNnrPlX87wLKVh2uJNx2FOAyH
 vD9Sa1arkl4tFF84cwc3sdKvHE4cmJ/EG5bifOBZR7tUKR7j9WH+JGjLQ1CJ9l5hLqAQ
 j4QIWP1zbmAupQfk+y6oQiKzhvrNCvWYLikGHgcqBPhIc6eI53XzExPJVuxXFDLaAh1/
 VptUwULppIpXsLOkXIELf2a3k0iIp2WE9VCxjUzhpdyEeyrx2i7NbFaWOkJpjvHV672k
 SUN7L9nodsE/RQBvAMz6mHbidjMRLqBrVJ6EZ5JtkXRHPOubZAzfOPH6ZcxkF2KTR48b
 twww==
X-Gm-Message-State: ANoB5pm6HFpJp7sYn3xYt8Ir+yIwQ8j0dNBeRfBXYbz+h0KP/ZyHfK2W
 pm8IDLx6UJk9/GeFDl4Cv2igfw==
X-Google-Smtp-Source: AA0mqf6YUbVx55VjofbOGv20oYItClmeaaYrzv2AGXNriaUJc3vjvWQY3mBerDHSiCAmiysil1O71Q==
X-Received: by 2002:adf:e410:0:b0:242:32d7:8605 with SMTP id
 g16-20020adfe410000000b0024232d78605mr14445615wrm.47.1670942091387; 
 Tue, 13 Dec 2022 06:34:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6b1c:7a12:6b7e:fcfb?
 ([2a01:e0a:982:cbb0:6b1c:7a12:6b7e:fcfb])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adfe609000000b0022eafed36ebsm12155989wrm.73.2022.12.13.06.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 06:34:51 -0800 (PST)
Message-ID: <9f0641d9-b5f6-ed05-1563-ae96ca873052@linaro.org>
Date: Tue, 13 Dec 2022 15:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: neil.armstrong@linaro.org
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <b7e891d1-d134-b489-eb2d-6125d4c7b6c6@theobroma-systems.com>
 <5f67e057-c41a-d4a0-b199-5840ae771e35@linaro.org>
 <f0dd213c-4a34-926d-3f3b-f2ed49bb92c3@linaro.org>
 <5ce0e4ad-b015-3487-614c-a60099dbede9@foss.st.com>
Organization: Linaro Developer Services
In-Reply-To: <5ce0e4ad-b015-3487-614c-a60099dbede9@foss.st.com>
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

T24gMTMvMTIvMjAyMiAxNTozMSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMS8yMi8yMiAyMDo0MywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IE9uIDIyLzExLzIwMjIg
MjA6MTEsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gT24gMjEvMTEvMjAy
MiAxMzoyMywgUXVlbnRpbiBTY2h1bHogd3JvdGU6Cj4+Pj4gSGkgUGF0cmljaywKPj4+Pgo+Pj4+
IFRoYW5rcyBmb3IgbG9va2luZyBhdCBpdC4KPj4+Pgo+Pj4+IE9uIDEwLzI4LzIyIDExOjAxLCBQ
YXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBTaW5jZSB0aGUgY29tbWl0IGQ1YmE2
MTg4ZGZiZiAoImNtZDogcHhlX3V0aWxzOiBDaGVjayBmZHRjb250cm9sYWRkcgo+Pj4+PiBpbiBs
YWJlbF9ib290IikgdGhlIEZEVCBvciB0aGUgRkRURElSIGxhYmVsIGlzIHJlcXVpcmVkIGluIGV4
dGxpbnV4LmNvbmYKPj4+Pj4gYW5kIHRoZSBmYWxsYmFjayBkb25lIGJ5IGJvb3RtIGNvbW1hbmQg
d2hlbiBvbmx5IHRoZSBkZXZpY2UgdHJlZSBpcyBwcmVzZW50Cj4+Pj4+IGluIHRoaXMgY29tbWFu
ZCBwYXJhbWV0ZXJzIGlzIG5vIG1vcmUgcGVyZm9ybWVkIHdoZW4gRklUIGlzIHVzZWQgZm9yCj4+
Pj4+IGtlcm5lbC4KPj4+Pj4KPj4+Pj4gVGhlIG5leHQgZmlsZSAiZXh0bGludXguY29uZiIgbm8g
bW9yZSBzZWxlY3RzIHRoZSBkZXZpY2UgdHJlZSBpbiBGSVQKPj4+Pj4gYnV0IHVzZSB0aGUgcHhl
IGZhbGxiYWNrIHdpdGggdGhlIGRldmljZSB0cmVlIG9mIFUtQm9vdC4KPj4+Pj4KPj4+Pj4gbWVu
dSB0aXRsZSBTZWxlY3QgdGhlIGJvb3QgbW9kZQo+Pj4+PiBERUZBVUxUIHRlc3QKPj4+Pj4gTEFC
RUwgdGVzdAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIEtFUk5FTCAvZml0SW1hZ2UKPj4+Pj4KPj4+
Pj4gVGhpcyBzZXJpZSByZXN0b3JlcyB0aGUgcG9zc2liaWxpdHkgdG8gdXNlIGEgRklUIGluIGV4
dGxpbnV4LmNvbmYKPj4+Pj4gYnkgdXNpbmcgRkRUIGxhYmVsIHdpdGggdGhlIHNhbWUgc3RyaW5n
Lgo+Pj4+Pgo+Pj4+PiBtZW51IHRpdGxlIFNlbGVjdCB0aGUgYm9vdCBtb2RlCj4+Pj4+IERFRkFV
TFQgdGVzdAo+Pj4+PiBMQUJFTCB0ZXN0Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgS0VSTkVMIC9m
aXRJbWFnZQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIEZEVCAvZml0SW1hZ2UKPj4+Pj4KPj4+Pj4g
ZXZlbiB3aGVuIGEgc3BlY2lmaWMgRklUIGNvbmZpZyBpcyB1c2VkOgo+Pj4+Pgo+Pj4+PiBtZW51
IHRpdGxlIFNlbGVjdCB0aGUgYm9vdCBtb2RlCj4+Pj4+IERFRkFVTFQgdGVzdAo+Pj4+PiBMQUJF
TCB0ZXN0Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgS0VSTkVMIC9maXRJbWFnZSNjb25maWcKPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoCBGRFQgL2ZpdEltYWdlI2NvbmZpZwo+Pj4+Pgo+Pj4+PiBUaGUg
bGFzdCBjb21taXQgb2YgdGhlIHNlcmllcyBpcyBvbmx5IGEgbWlub3IgaW1wcm92ZW1lbnQuCj4+
Pj4+Cj4+Pj4KPj4+PiBJIHRlc3RlZCB0aGlzIG9uIG15IFB1bWEgUkszMzk5IGFuZCBpdCBkb2Vz
IHdvcmsgYWdhaW4sIHRoYW5rcy4KPj4+Pgo+Pj4+IEhvd2V2ZXIsIEknbSBub3Qgc3VyZSB0aGlz
IGlzIHdoYXQgd2Ugc2hvdWxkIGdvIGZvcj8KPj4+Pgo+Pj4+IE15IHdvcnJ5IGlzIHRoZSBmb2xs
b3dpbmc6Cj4+Pj4gV2hhdCBoYXBwZW5zIGZvciBvbGQgcmVsZWFzZXMgKHByZS12MjAyMi4wNCkg
d2hlcmUgS0VSTkVMIHdvcmtlZCBqdXN0IGZpbmUgd2l0aG91dCB0aGUgRkRUIHRvIGxvYWQgdGhl
IGZkdCBmcm9tIHRoZSBmaXRpbWFnZSBjb25mIHNwZWNpZmllZCBpbiBLRVJORUwgZmllbGQ/IFdv
dWxkIHdlIG5vdyBuZWVkIHRvIGtlZXAgYW4gZXh0bGludXguY29uZiBmb3IgcHJlLTIwMjIuMDQg
cmVsZWFzZXMgd2hlcmUgRkRUIHdvdWxkbid0IGJlIHNldCBhbmQgb25lIGZvciAyMDIzLjAxIGFu
ZCBsYXRlciB3aGVyZSBGRFQgd291bGQgYmUgbWVudGlvbmVkPyBUaGF0IGRvZXMgbm90IHNlZW0g
bGlrZSBhIGdvb2QgdGhpbmcgZm9yIGRpc3Ryb3MuCj4+Pj4KPj4+PiBJIHVuZm9ydHVuYXRlbHkg
Y2Fubm90IGFuc3dlciB0aGUgcXVlc3Rpb24gbXlzZWxmIHdpdGhvdXQgc3BlbmRpbmcgc2lnbmlm
aWNhbnQgZWZmb3J0IHBhdGNoaW5nIHYyMDIyLjAxIHRvIGdldCBpdCB0byB3b3JrIG9uIG91ciBQ
dW1hIG1vZHVsZS4gRG9lcyBhbnlvbmUgaGF2ZSBhY2Nlc3MgdG8gYSBib2FyZCB0byBxdWlja2x5
IGNoZWNrIGFuIGV4dGxpbnV4LmNvbmYgd2l0aCBLRVJORUwgYW5kIEZEVCBzZXQgdG8gL2ZpdElt
YWdlIG9uIGEgdjIwMjIuMDEgcmVsZWFzZT8KPj4+Cj4+PiBJJ20gYnVpbGRpbmcga2lya3N0b25l
IGltYWdlcyB3aXRoIG1ldGEtbWVzb24gaGF2aW5nIHYyMDIyLjAxLCBJJ2xsIHRlc3Qgd2l0aCBG
RFQgc2V0IHRvIC9maXRJbWFnZSB0byBzZWUgaWYgaXQgYnJlYWtzLgo+Pgo+PiBJdCBicmVha3M6
Cj4+IEZvdW5kIC9leHRsaW51eC9leHRsaW51eC5jb25mCj4+IFJldHJpZXZpbmcgZmlsZTogL2V4
dGxpbnV4L2V4dGxpbnV4LmNvbmYKPj4gMTrCoMKgwqAgWW9jdG8KPj4gUmV0cmlldmluZyBmaWxl
OiAvZml0SW1hZ2UKPj4gYXBwZW5kOiByb290PVBBUlRVVUlEPTNlYmMwMDA1LTAyIHJvb3R3YWl0
IGNvbnNvbGU9dHR5QU1MMCwxMTUyMDAKPj4gUmV0cmlldmluZyBmaWxlOiAvZml0SW1hZ2UKPj4g
QmFkIExpbnV4IEFSTTY0IEltYWdlIG1hZ2ljIQo+PiBTQ1JJUFQgRkFJTEVEOiBjb250aW51aW5n
Li4uCj4+Cj4gCj4gQ2FuIHlvdSBzaGFyZSB0aGUgZXh0bGludXggZmlsZSB1c2VkIGZvciB5b3Vy
IHRlc3QgP2RvIHlvdSBoYXZlIG15IHBhdGNoID8KCkl0IHdhcyBleHBsaWNpdGx5IHdpdGhvdXQg
eW91ciBwYXRjaCBhcyBRdWVudGluIGFza2VkLCBoZSBob3BlZCBhZGRpbmdoCiJGRFQgL2ZpdElt
YWdlIiB3b3VsZCBub3QgYnJlYWsgdS1ib290IHByZSBkNWJhNjE4OGRmYmYsIGJ1dCBuby4KCj4g
Cj4gCj4gYmVjYXVzZSBJIHRlc3QgdGhlIGNvbmZpZyBvbiBteSBib2FyZCAoU1RNMzJNUDE1eCAv
IGFybXY3KSB0aGUgMiBjYXNlcyA6Cj4gCj4gCj4gREVGQVVMVCB0ZXN0Cj4gTEFCRUwgdGVzdAo+
ICDCoMKgwqDCoMKgwqDCoMKgIEtFUk5FTCAvZml0SW1hZ2UKPiAgwqDCoMKgwqDCoMKgwqDCoCBG
RFQgL2ZpdEltYWdlCj4gCj4gCj4gQW5kCj4gCj4gCj4gREVGQVVMVCB0ZXN0Cj4gTEFCRUwgdGVz
dAo+ICDCoMKgwqDCoMKgwqDCoMKgIEtFUk5FTCAvZml0SW1hZ2UjY29uZmlnCj4gIMKgwqDCoMKg
wqDCoMKgwqAgRkRUIC9maXRJbWFnZSNjb25maWcKPiAKPiAKPiBhbmQgbm9ybWFsbHkgdGhlIGZp
bGUgaXMgcmV0cmlldmVkIG9uZSB0aW1lID0+ICIvZml0SW1hZ2UiCj4gCj4gYW5kIGluIHRoZSB0
cmFjZSBpdCBpcyByZXRyaWV2aW5nIDIgdGltZXMgPSAiUmV0cmlldmluZyBmaWxlOiAvZml0SW1h
Z2UiIGFuZCBpdCBpcyBzdGFuZ2UKPiAKPiAKPiBJIGtub3cgSSBoYXZlIGxpbWl0YXRpb24gZm9y
IG1peGVkIGNvbmZpZzoKPiAKPiBERUZBVUxUIHRlc3QKPiBMQUJFTCB0ZXN0Cj4gIMKgwqDCoMKg
wqDCoMKgwqAgS0VSTkVMIC9maXRJbWFnZQo+ICDCoMKgwqDCoMKgwqDCoMKgIEZEVCAvZml0SW1h
ZyNjb25maWcKPiAKPiAKPiBEbyB5b3UgaGF2ZSB0aGlzIHR5cGUgb2YgZXh0bGludXguY29uZiA/
Cj4gCj4gCj4+Pgo+Pj4gTmVpbAo+Pj4KPj4+Pgo+Pj4+IElzIHRoZXJlIHJlYWxseSBubyBvdGhl
ciB3YXkgdGhhbiBhZGRpbmcgdGhpcyBuZXcgcmVxdWlyZW1lbnQ/IChOb3RoaW5nIGFnYWluc3Qg
aXQgaWYgaXQgZG9lcyBub3QgYnJlYWsgb2xkZXIgcmVsZWFzZXMgd2l0aCB0aGUgIm5ldyIgZXh0
bGludXguY29uZiB0aG91Z2gpLgo+IAo+IAo+IFRoZSBjb21taXQgZDViYTYxODhkZmJmICgiY21k
OiBweGVfdXRpbHM6IENoZWNrIGZkdGNvbnRyb2xhZGRyIGluIGxhYmVsX2Jvb3QiKSBhcmVhZHkg
YnJlYWsgdGhlIGV4dGxpbnV4LmNvbmYgc3VwcG9ydC4uLi4uCj4gCj4gPT4gRlREIG9yIEZEVERJ
UiBpcyBub3cgbWFuZGF0b3J5IHNvIHBvdGVudGlhbGx5LCBzb21lIHdvcmtpbmcgZXh0bGludXgu
Y29uZiBpcyBvdCBtb3JlIHdvcmtpbmcKPiAKPiAgwqAgwqAgwqAgc2luY2XCoCB2MjAyMi4wMS1y
YzIKPiAKPiAKPiBGb3IgZXhhbXBsZToKPiAKPiAKPiBtZW51IHRpdGxlIFNlbGVjdCB0aGUgYm9v
dCBtb2RlCj4gREVGQVVMVCB0ZXN0Cj4gTEFCRUwgdGVzdAo+ICDCoMKgwqDCoMKgwqDCoMKgIEtF
Uk5FTCAvZml0SW1hZ2UKPiAKPiAKPiBCdXQgdGhpcyBpc3N1ZSBpcyBub3QgbGlua2VkIHRvIHRo
aXMgc2VyaWUsCj4gCj4gSSBqdXN0IHRyeSB0byBjb3JyZWN0IHRoZSByZWdyZXNzaW9uCj4gCj4g
LSBrZWVwIHRoZSBuZXcgYmVoYXZpb3IgKHVzZWZ1bGwgd2hlbiBGSVQgaXMgbm90IHVzZWQpCj4g
Cj4gLSBhZGQgYSB3YXkgdG8gaGF2ZSBhIGZ1bmN0aW9uYWwgZXh0bGludXguY29uZiBmb3IgRklU
Cj4gCj4gIMKgwqAgKGV2ZW4gaWYgZXh0bGludXguY29uZiBmaWxlcyBuZWVkIHRvIGJlIG1vZGlm
aWVkIGFuZCBpdCBpcyBkaWZmaWN1bHQgZm9yICdkaXN0cm9zJykKPiAKPiAKPj4+Pgo+Pj4+IENo
ZWVycywKPj4+PiBRdWVudGluCj4+Pgo+Pgo+IAo+IEkgZG9uJ3QgZm91bmQgYSBvdGhlciBzb2x1
dGlvbiAvIGJldHRlciBzb2x1dGlvbiBmb3IgdjIwMi4wMSA9PiB2MjAyMy4wMS4uLgo+IAo+IFJl
Z2FyZHMKPiAKPiAKPiBQYXRyaWNrCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
