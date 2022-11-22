Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0440263445E
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Nov 2022 20:11:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0AB5C5F1ED;
	Tue, 22 Nov 2022 19:11:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F668C03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 19:11:38 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id i12so22312446wrb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 11:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oux2agNqoYxrYmYdaFKpNuQ2r9Vb7GLQflfcDZTlaF0=;
 b=r0LHhCUmEVOLPimxwBk/KdH5xOxs9imFWFmmKZMjOYNbVBSgLXFg9VgtnHvzFgudiT
 tYYP0JjXTZRKfoVr5XLDrlk+QKMV2NTBm4bvT+RPj5ebQOqNKtgHIZCblc58ZdMGQLaq
 Zkg57hp1em8jRu0gh6EH6X+pY4CvRAl09uNxHoxLOcM/n6DbPkN2nFTWBLHikj1eORyy
 jXysGnCsIGMSOP7rpmo0u7RaslEe5rdeYxBazhJWlPVrL4D3Y7y7VSYeVD6BZ13rNfjp
 hb67LCMi+QkhHe2UW+EqDdmfGBCnZPpcdMs33mCzax5YHtugCqL4ps8zNZ5Liqte6fSe
 /3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oux2agNqoYxrYmYdaFKpNuQ2r9Vb7GLQflfcDZTlaF0=;
 b=VuME4fvzPQRzTQwvRlaE8O9HQpfxgF6/6SgjQZrSl+ZeZcaic8oQRQf8Q0V08BGtzl
 JUzMUbxdi9i787foxOHYGAkRL9i32NY//y4F3KCtGUtzXIsa3I5dNKtuwvbQVBkbwyFF
 e4rH8oycTaiLikKXJnOf7cffC7MwRV9qblRbEAtlovP8RTcnlmPAJoJiKWvXuLNjqFdS
 RtlnSSjNd0WqayHo4Y4C2o8F7hs0m7V9j6rtYNQEQd9xBvx/SLgLQfIGINOsgmgO8XhW
 fGVwLx2WoR4MdGaHcu45A/QHZwYDD+yTdsMwp2DSZWQ9SWo953U9++1ZbcsWALd9dwhM
 k7hg==
X-Gm-Message-State: ANoB5ple3o3Ut+aTpCm13Bv0UJncPXwFmH7rwk1AfwhLPioQjVGLTieU
 D3sBt5G9YpUXAc0dZcfaR8PGnA==
X-Google-Smtp-Source: AA0mqf6DfYjYQ/XK64eS2k4CC3XFHYf/fvypD7AWWgMF1hcQnAQcZcZyDpEU1FnMHM+onR2dpwI6EA==
X-Received: by 2002:a5d:5914:0:b0:236:57f3:c9e6 with SMTP id
 v20-20020a5d5914000000b0023657f3c9e6mr15001430wrd.21.1669144297577; 
 Tue, 22 Nov 2022 11:11:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0?
 ([2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a5d4b0e000000b002416e383e1csm14896956wrq.25.2022.11.22.11.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 11:11:37 -0800 (PST)
Message-ID: <5f67e057-c41a-d4a0-b199-5840ae771e35@linaro.org>
Date: Tue, 22 Nov 2022 20:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <b7e891d1-d134-b489-eb2d-6125d4c7b6c6@theobroma-systems.com>
Organization: Linaro Developer Services
In-Reply-To: <b7e891d1-d134-b489-eb2d-6125d4c7b6c6@theobroma-systems.com>
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

SGksCgpPbiAyMS8xMS8yMDIyIDEzOjIzLCBRdWVudGluIFNjaHVseiB3cm90ZToKPiBIaSBQYXRy
aWNrLAo+IAo+IFRoYW5rcyBmb3IgbG9va2luZyBhdCBpdC4KPiAKPiBPbiAxMC8yOC8yMiAxMTow
MSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4KPj4gU2luY2UgdGhlIGNvbW1pdCBkNWJhNjE4
OGRmYmYgKCJjbWQ6IHB4ZV91dGlsczogQ2hlY2sgZmR0Y29udHJvbGFkZHIKPj4gaW4gbGFiZWxf
Ym9vdCIpIHRoZSBGRFQgb3IgdGhlIEZEVERJUiBsYWJlbCBpcyByZXF1aXJlZCBpbiBleHRsaW51
eC5jb25mCj4+IGFuZCB0aGUgZmFsbGJhY2sgZG9uZSBieSBib290bSBjb21tYW5kIHdoZW4gb25s
eSB0aGUgZGV2aWNlIHRyZWUgaXMgcHJlc2VudAo+PiBpbiB0aGlzIGNvbW1hbmQgcGFyYW1ldGVy
cyBpcyBubyBtb3JlIHBlcmZvcm1lZCB3aGVuIEZJVCBpcyB1c2VkIGZvcgo+PiBrZXJuZWwuCj4+
Cj4+IFRoZSBuZXh0IGZpbGUgImV4dGxpbnV4LmNvbmYiIG5vIG1vcmUgc2VsZWN0cyB0aGUgZGV2
aWNlIHRyZWUgaW4gRklUCj4+IGJ1dCB1c2UgdGhlIHB4ZSBmYWxsYmFjayB3aXRoIHRoZSBkZXZp
Y2UgdHJlZSBvZiBVLUJvb3QuCj4+Cj4+IG1lbnUgdGl0bGUgU2VsZWN0IHRoZSBib290IG1vZGUK
Pj4gREVGQVVMVCB0ZXN0Cj4+IExBQkVMIHRlc3QKPj4gwqDCoMKgwqDCoMKgwqDCoCBLRVJORUwg
L2ZpdEltYWdlCj4+Cj4+IFRoaXMgc2VyaWUgcmVzdG9yZXMgdGhlIHBvc3NpYmlsaXR5IHRvIHVz
ZSBhIEZJVCBpbiBleHRsaW51eC5jb25mCj4+IGJ5IHVzaW5nIEZEVCBsYWJlbCB3aXRoIHRoZSBz
YW1lIHN0cmluZy4KPj4KPj4gbWVudSB0aXRsZSBTZWxlY3QgdGhlIGJvb3QgbW9kZQo+PiBERUZB
VUxUIHRlc3QKPj4gTEFCRUwgdGVzdAo+PiDCoMKgwqDCoMKgwqDCoMKgIEtFUk5FTCAvZml0SW1h
Z2UKPj4gwqDCoMKgwqDCoMKgwqDCoCBGRFQgL2ZpdEltYWdlCj4+Cj4+IGV2ZW4gd2hlbiBhIHNw
ZWNpZmljIEZJVCBjb25maWcgaXMgdXNlZDoKPj4KPj4gbWVudSB0aXRsZSBTZWxlY3QgdGhlIGJv
b3QgbW9kZQo+PiBERUZBVUxUIHRlc3QKPj4gTEFCRUwgdGVzdAo+PiDCoMKgwqDCoMKgwqDCoMKg
IEtFUk5FTCAvZml0SW1hZ2UjY29uZmlnCj4+IMKgwqDCoMKgwqDCoMKgwqAgRkRUIC9maXRJbWFn
ZSNjb25maWcKPj4KPj4gVGhlIGxhc3QgY29tbWl0IG9mIHRoZSBzZXJpZXMgaXMgb25seSBhIG1p
bm9yIGltcHJvdmVtZW50Lgo+Pgo+IAo+IEkgdGVzdGVkIHRoaXMgb24gbXkgUHVtYSBSSzMzOTkg
YW5kIGl0IGRvZXMgd29yayBhZ2FpbiwgdGhhbmtzLgo+IAo+IEhvd2V2ZXIsIEknbSBub3Qgc3Vy
ZSB0aGlzIGlzIHdoYXQgd2Ugc2hvdWxkIGdvIGZvcj8KPiAKPiBNeSB3b3JyeSBpcyB0aGUgZm9s
bG93aW5nOgo+IFdoYXQgaGFwcGVucyBmb3Igb2xkIHJlbGVhc2VzIChwcmUtdjIwMjIuMDQpIHdo
ZXJlIEtFUk5FTCB3b3JrZWQganVzdCBmaW5lIHdpdGhvdXQgdGhlIEZEVCB0byBsb2FkIHRoZSBm
ZHQgZnJvbSB0aGUgZml0aW1hZ2UgY29uZiBzcGVjaWZpZWQgaW4gS0VSTkVMIGZpZWxkPyBXb3Vs
ZCB3ZSBub3cgbmVlZCB0byBrZWVwIGFuIGV4dGxpbnV4LmNvbmYgZm9yIHByZS0yMDIyLjA0IHJl
bGVhc2VzIHdoZXJlIEZEVCB3b3VsZG4ndCBiZSBzZXQgYW5kIG9uZSBmb3IgMjAyMy4wMSBhbmQg
bGF0ZXIgd2hlcmUgRkRUIHdvdWxkIGJlIG1lbnRpb25lZD8gVGhhdCBkb2VzIG5vdCBzZWVtIGxp
a2UgYSBnb29kIHRoaW5nIGZvciBkaXN0cm9zLgo+IAo+IEkgdW5mb3J0dW5hdGVseSBjYW5ub3Qg
YW5zd2VyIHRoZSBxdWVzdGlvbiBteXNlbGYgd2l0aG91dCBzcGVuZGluZyBzaWduaWZpY2FudCBl
ZmZvcnQgcGF0Y2hpbmcgdjIwMjIuMDEgdG8gZ2V0IGl0IHRvIHdvcmsgb24gb3VyIFB1bWEgbW9k
dWxlLiBEb2VzIGFueW9uZSBoYXZlIGFjY2VzcyB0byBhIGJvYXJkIHRvIHF1aWNrbHkgY2hlY2sg
YW4gZXh0bGludXguY29uZiB3aXRoIEtFUk5FTCBhbmQgRkRUIHNldCB0byAvZml0SW1hZ2Ugb24g
YSB2MjAyMi4wMSByZWxlYXNlPwoKSSdtIGJ1aWxkaW5nIGtpcmtzdG9uZSBpbWFnZXMgd2l0aCBt
ZXRhLW1lc29uIGhhdmluZyB2MjAyMi4wMSwgSSdsbCB0ZXN0IHdpdGggRkRUIHNldCB0byAvZml0
SW1hZ2UgdG8gc2VlIGlmIGl0IGJyZWFrcy4KCk5laWwKCj4gCj4gSXMgdGhlcmUgcmVhbGx5IG5v
IG90aGVyIHdheSB0aGFuIGFkZGluZyB0aGlzIG5ldyByZXF1aXJlbWVudD8gKE5vdGhpbmcgYWdh
aW5zdCBpdCBpZiBpdCBkb2VzIG5vdCBicmVhayBvbGRlciByZWxlYXNlcyB3aXRoIHRoZSAibmV3
IiBleHRsaW51eC5jb25mIHRob3VnaCkuCj4gCj4gQ2hlZXJzLAo+IFF1ZW50aW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
