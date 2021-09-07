Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D7A402E85
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Sep 2021 20:46:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A7A5C59781;
	Tue,  7 Sep 2021 18:46:47 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9056FC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 18:46:45 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 107-20020a9d0bf4000000b0051b8be1192fso289172oth.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yIcyJ1Y9kvGLmaTaZRpfJ0SzPGz9UIb4FUgYJHaJh5s=;
 b=GSmDTfNNHsRZ18I4W8W6CWocz+T+QaxJXG/H8ReDdq9emr8lQGpiMzQVq5CXald8iI
 oe74mlbK+ZZGwbnFUnixNwGeHgqKKoo1uQ4Xe6+dksaw5AMDr3z+SsIaYswEbFixD2mm
 tBKV9TkJO6gVnCt3FLgAPGsuYElb6aD2Ww6h2d0mn5/Awl1i2h83YdnGGCD4MtVQQkt2
 reN0DNXeM5q7LI432Nw/NV4UrURndqHNnEdaV6Gobdk9dflJCV0sqUEFzxJUNSC7tWOv
 sStrnvq9ZUMcrReJfp3+jYMLDFc9HUGtSFpkH89yipGzQkJOX1JZ9E2MQmQhUR+wYNjl
 NHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yIcyJ1Y9kvGLmaTaZRpfJ0SzPGz9UIb4FUgYJHaJh5s=;
 b=FrLuld30rvi4DIKNdT/0Wb6EZ2gFb+IlXLxVqiy813yxj3AOP4XV1VYD40OGQrxpWC
 dp9ZLZafXdq1F1Mx7bQO3I1Po+8CDVtoH9eFEcSfSYGcEqbIQviC0rq7h5B9DrhpQcL8
 +sFoMekJc27TPI4d1QmQAhB1mGV1clwJvMC0jUJ5/I2dibNJ+ujK/BtCPzOZrLh8H8QE
 pjH7KxilEkaOyd3+qEiWi4GKS9mKavA+ZtVgc6+6lfqXVAocMovCZC6aeFED+b2JSMAl
 6hDVWkLizo+ZTP1z2dEvTPGgnrbhC8byFLCC8NrFAQ619r2ftdj/S3a3JA6iqHuK+LQV
 xQjQ==
X-Gm-Message-State: AOAM531tJHUxsF6fx8vIWjio0wkAhe3SlW87hKkXgEw92pnQd+Rr8ef7
 wXIwtCNuNeGR4qao5DtO3Fbm+HrXI+Ttmg==
X-Google-Smtp-Source: ABdhPJxXaEyyVgylqUm41ZDwdLehiG++MxYJ6xSoBsDYfvzf8hPCtOr/DRsz7TlENsyWxDgUDxS9XQ==
X-Received: by 2002:a05:6830:1f0a:: with SMTP id
 u10mr16539413otg.53.1631040404020; 
 Tue, 07 Sep 2021 11:46:44 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id c14sm2560343otd.62.2021.09.07.11.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 11:46:43 -0700 (PDT)
From: "Alex G." <mr.nuke.me@gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
References: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
 <569089c3-8936-2a47-930e-218805064413@gmail.com>
 <CAN5uoS_-rCBtWdXe+_neH3iwnUOzdExX7OayUq3P+ufeohioPg@mail.gmail.com>
 <ca6ac42b-3337-5d48-756b-eaafa1266d60@foss.st.com>
 <d730a496-60a9-150b-549a-e2c74d6e44d1@gmail.com>
Message-ID: <ff303575-401b-d988-5c0c-773e7e233590@gmail.com>
Date: Tue, 7 Sep 2021 13:46:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d730a496-60a9-150b-549a-e2c74d6e44d1@gmail.com>
Content-Language: en-US
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@freebsd.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 Samuel Holland <samuel@sholland.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Simon Glass <sjg@chromium.org>, Tero Kristo <t-kristo@ti.com>,
 Michael Walle <michael@walle.cc>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lib: optee: remove the duplicate
	CONFIG_OPTEE
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

CgpPbiA5LzYvMjEgNTozOSBQTSwgQWxleCBHLiB3cm90ZToKPiAKPiAKPiBPbiA5LzYvMjEgMTE6
NTMgQU0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+Pgo+Pj4+IEluIGZhY3QsIHRoZSBTUEwg
Ym9vdCBwYXRoIGZvciBPUC1URUUgZG9lc24ndCB1c2UgdGhpcyBmdW5jdGlvbi4gVGhhdCdzCj4+
Pj4gaW50ZW50aW9uYWwuCj4+Pj4KPj4+PiBIZXJlJ3Mgd2hhdCBJIHN1Z2dlc3Q6Cj4+Pj4gwqDC
oMKgIC0gUmVtb3ZlIE9QVEVFX1RaRFJBTV9CQVNFIGFuZCBfU0laRQo+Pj4gVGhlcmUgaXMgc29t
ZSBsZWdhY3kgaGVyZSwgYm9hcmQvd2FycDdhbmQgYm9hcmQvdGVjaG5leGlvbi9waWNvLWlteDdk
Lgo+Pgo+Pgo+PiBpdCBpcyBub3QgcG9zc2libGUsIGl0IGlzIHVzZWQgZm9yIFUtQm9vdCBwcm9w
ZXIgb24gb3RoZXIgcGxhdGZvcm1zCj4+Cj4+IGJvYXJkL3dhcnA3L3dhcnA3LmM6Mzg6wqDCoMKg
IMKgwqDCoCBnZC0+cmFtX3NpemUgLT0gQ09ORklHX09QVEVFX1RaRFJBTV9TSVpFOwo+PiBib2Fy
ZC93YXJwNy93YXJwNy5jOjEyMjrCoMKgwqAgb3B0ZWVfc3RhcnQgPSBvcHRlZV9lbmQgLSAKPj4g
Q09ORklHX09QVEVFX1RaRFJBTV9TSVpFOwo+PiBib2FyZC90ZWNobmV4aW9uL3BpY28taW14N2Qv
cGljby1pbXg3ZC5jOjU2OiBnZC0+cmFtX3NpemUgLT0gCj4+IENPTkZJR19PUFRFRV9UWkRSQU1f
U0laRTsKPj4gaW5jbHVkZS9jb25maWdzL214N19jb21tb24uaDo1MjojaWYgKENPTkZJR19PUFRF
RV9UWkRSQU1fU0laRSAhPSAwKQo+IAo+IEkgaGF2ZSBhbiBpZGVhIGhvdyB0byB3b3JrIGFyb3Vu
ZCB0aGF0LgoKVGhpcyBpcyB3aGF0IEkgaGFkIGluIG1pbmQgWzFdLiBXaXRoIHRoaXMsIG9wdGVl
X3ZlcmlmeV9ib290bV9pbWFnZSgpIGlzIApqdXN0IHRocmVlIG9yIGZvdXIgY2hlY2tzLgoKSSBw
cm9wb3NlIHRoYXQgY29kZSB3aGljaCB3b3VsZCBoYXZlIGJlZW4gdW5kZXIgQ09ORklHX09QVEVF
X0lNQUdFLCBpcyAKaW5zdGVhZCBtb3ZlZCB1bmRlciBDT05GSUdfQk9PVE1fT1BURUUuIFRodXMg
dGhlcmUncyBubyBuZWVkIGZvciAKQ09ORklHX09QVEVFX0lNQUdFIGluIHRoZSBmaXJzdCBwbGFj
ZSwgYW5kIGFsbCB0aGUgb3RoZXIgY2hhbmdlcyBtYWtlIHNlbnNlLgoKQWxleAoKClsxXSBodHRw
czovL2xpc3RzLmRlbnguZGUvcGlwZXJtYWlsL3UtYm9vdC8yMDIxLVNlcHRlbWJlci80NTk5ODEu
aHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
