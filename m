Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 279483CAA56
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Jul 2021 21:11:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDF8EC58D7F;
	Thu, 15 Jul 2021 19:11:13 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BB3AC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 19:11:11 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso7274591otu.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uzM7ByjExLgBI5x/ZM0cBkavYvHV6mr5r8qebi86spM=;
 b=N6m2VPkWCvT/s00Wfhz3zG9IYzxZGQcym+3FyYYoBuR5eukjJOTcDwAmD4CFt6Tj6V
 42HLGQk5ofE0H3OV7s6B7hdTeOXmclPcIa8ztm7GP2H0YdcHjtzZAz9wYAe6Qe7ZK7P7
 rik9bFMvOXAQiYqPm0DrDzkRR6BCxKInKQiGUGUoLQja9FhDT3uFv2EwTSSRsyBZQNsq
 ERkS6WIZjfZ4MqlCjZdKB7sR4gkWFNoi2YK63fuZk/30LrkTi6T59KClN5OQ9jIQl7Rs
 +ikmo1PQUv8crO/qD15MAgVmxRcljuGDzlDiEXViRa4eQoZzHDJKiMBj712FNT0HU09G
 jV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uzM7ByjExLgBI5x/ZM0cBkavYvHV6mr5r8qebi86spM=;
 b=XIhF8HLcG8JBDxBQHUQaKf7tsu59fEQUa2q0j+WobutbSZO3sbMIfwRPz9FOurejbk
 tosYsZUDC5gM7n8DzmB8o6VorIlD6DOmEq+B2D7QX2KgUA6eDBa6UBJGKXbrK1JU9f0E
 +59j1+KjQSKEJP2JPV0cMG9ykNjMD04mv4N2mKjRxXrr4xDuRv+ULhZGp5ELKIhH0oQN
 Zj+JThs2xoHkkshDkRWUKeI+n3fbBBjnZca1slhOhH+cCmw3KyXkhBQ7AWWskp5v2mCx
 scKURXpxYHpTJPFhqU7zL0eF/3vM3nZ+38FMtDM1NtFxHkT6Is2LmgOQ+E1/SMDmOlT8
 BUqg==
X-Gm-Message-State: AOAM5325Y2i5/BQRLjBk5I/Yiyq7zB9+ArEFmNxfVswj2MITbw1p5WyU
 dulgfpRM8Ow+TOOskHBtnn4caURmYo4=
X-Google-Smtp-Source: ABdhPJy4Px6Z5l/JP0mglDhdArDY7LA8YQ2b3Z9Dqoh9wfQTdb4wCTcJ4IUnHNK8MiYgsJ111k+KDw==
X-Received: by 2002:a05:6830:1f2b:: with SMTP id
 e11mr5074514oth.336.1626376269468; 
 Thu, 15 Jul 2021 12:11:09 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x129sm1414632oia.26.2021.07.15.12.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 12:11:08 -0700 (PDT)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 trini@konsulko.com
References: <20210531174314.1395666-1-mr.nuke.me@gmail.com>
 <20210531174314.1395666-2-mr.nuke.me@gmail.com>
 <dbafced5-3500-81a2-69ca-f151c2c3abf8@foss.st.com>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <6610a43e-d4af-b0ab-d8fa-13f0d2c9a6bc@gmail.com>
Date: Thu, 15 Jul 2021 14:11:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dbafced5-3500-81a2-69ca-f151c2c3abf8@foss.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, sjg@chromium.org,
 etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH v4 1/5] spl: mmc: Support OP-TEE payloads
	in Falcon mode
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

CgpPbiA3LzE1LzIxIDE6MjcgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCgpbc25p
cF0KCj4gV2hlbiBJIG1lcmdlIHRoaXMgcGF0Y2ggb24gbWFzdGVyIGJyYW5jaCwgSSBnZXQgdGhl
IGVycm9yOgo+IAo+IGFybTrCoCArwqDCoCBpbXg2ZGxfbWFtb2oKPiArc3BsL3UtYm9vdC1zcGwu
YmluIGV4Y2VlZHMgZmlsZSBzaXplIGxpbWl0Ogo+ICvCoCBsaW1pdDrCoCAweGVmYTAgYnl0ZXMK
PiArwqAgYWN0dWFsOiAweGY0MWQgYnl0ZXMKPiArwqAgZXhjZXNzOiAweDQ3ZCBieXRlcwo+ICtt
YWtlWzFdOiAqKiogW01ha2VmaWxlOjE5OTc6IHNwbC91LWJvb3Qtc3BsLmJpbl0gRXJyb3IgMQo+
ICttYWtlWzFdOiAqKiogRGVsZXRpbmcgZmlsZSAnc3BsL3UtYm9vdC1zcGwuYmluJwo+ICttYWtl
OiAqKiogW01ha2VmaWxlOjE3Nzogc3ViLW1ha2VdIEVycm9yIDIKCj4gVGhpcyBpc3N1ZSBuZWVk
IHRvIGJlIHNvbHZlZCBiZWZvcmUgSSBhY2NlcHQgYW5kIG1lcmdlIHRoZSBzZXJpZS4KCk9rYXks
IEknbGwgaGF2ZSB0byBkcm9wIHRoZSBjYWxsIHRvIGdlbmltZ19nZXRfb3NfbmFtZSgpLgoKCj4g
QnV0IEkgdGhpbmsgYWdhaW4gYWJvdXQgdGhlIHRpdGxlIG9mIHRoaXMgcGF0Y2ggOgo+IAo+IC0g
c3BsOiBtbWM6IFN1cHBvcnQgT1AtVEVFIHBheWxvYWRzIGluIEZhbGNvbiBtb2RlCj4gCj4gCj4g
SWYgSSB1bnRlcnN0b29kIGFmdGVyIHRoZSBzZXJpZSB0aGUgc2VxdWVuY2UgZm9yIE1NQyBpczoK
PiAKPiAgwqDCoMKgwqAgUk9NIGNvZGUgPT4gU1BMID0+IFRFRSAoYXMgcmF3IE9TKSA9PiBVLUJv
b3QKPiAKPiAKPiBidXQgaXQgaXMgbm90IHJlYWxseSB0aGUgRmFsY29uIG1vZGUgYW5kCj4gT1At
VEVFICsgZmFsY29uIG1vZGUgaXMgbm90IHJlYWxseSBzdXBwb3J0ZWQuLi4KPiAKPiAKPiBBbmQg
dGhlIHBhdGNoIHRpdGxlIGlzIGRpc3R1cmJpbmcuCj4gCj4gCj4gRm9yIG1lIHRoZSBjb3JyZWN0
IHNlcXVlbmNlIGlzIGluIEZhbGNvbiBtb2RlIGlzIDoKPiAKPiAgwqDCoMKgIFJPTSBjb2RlID0+
IFNQTCA9PiBURUUgKHNlY3VyZSB3b3JsZCkgPT4ga2VybmVsIChub3JtYWwgd29ybGQpCj4gCgpU
aGlzIGlzIGV4YWN0bHkgdGhlIHVzZSBjYXNlIHRoYXQgdGhpcyBwYXRjaCBpbnRlbmRzIHRvIHN1
cHBvcnQuCgo+IAo+IFdpdGggdGhlIFRFRSBhbmQgdGhlIGtlcm5lbCBsb2FkZWQgYnkgdGhlIFNQ
TC4uLi4uLgo+IAo+IAo+IGFuZCB3aXRob3V0IGZhbGNvbiBtb2RlIDoKPiAKPiAoQSkgwqDCoCBS
T00gY29kZSA9PiBTUEwgPT4gVEVFIChzZWN1cmUgd29ybGQpID0+IFUtQm9vdAo+IAo+IG9yCj4g
Cj4gKEIpwqDCoMKgIFJPTSBjb2RlID0+IFNQTCAoVFopID0+IFUtQm9vdCAoVFopIGV4ZWN1dGUg
Ym9vdG0gPT4gVEVFIChzZWN1cmUgCj4gd29ybGQpID0+IGtlcm5lbAo+IAo+IAo+IHdoYXQgaXQg
eW91ciBleHBlY3RlZCBzZXF1ZW5jZSBpbiBzcGxfbG9hZF9zaW1wbGVfZml0IGluIHRoaXMgc2Vy
aWUgLyBpbiAKPiB5b3VyIGRlZmNvbmZpZyA/Cj4gCj4gVG9kYXkgd2l0aCB0aGUgbm9ybWFsIHdv
cmxkIGFkZHJlc3MgY2FuIGJlOgo+IAo+IDEvID0gc3BsX2ltYWdlLT5lbnRyeV9wb2ludCAoYm9v
dG1fb3MuYyBpbiBVLUJvb3QgcHJvcHJlcikKPiAKPiAyLyA9IENPTkZJR19TWVNfVEVYVF9CQVNF
IChoYXJkY29kZWQgZm9yIFNQTCBpbiBzcGxfb3B0ZWUuUykKPiAKPiAKPiBmb3IgMi8gV2hlbiBV
LUJvb3QgaXMgbm90IHVzZWQgYWZ0ZXIgU1BMID3CoCBpbiBmYWxjb24gbW9kZSwKPiAKPiB0aGUg
TFIgcmVnaXN0ZXIgc2hvdWQgYmUgc2V0IHRvIGtlcm5lbCBlbnRyeSBwb2ludC4KCkhvdyBkb2Vz
IFNQTCBrbm93IHdoZXJlIE9QLVRFRSBzaG91bGQganVtcCB0bz8gT25lIGNvdWxkIHBhcnNlIHRo
ZSBGSVQgCmltYWdlLCBhbmQgdHJ5IHRvIGZpZ3VyZSBvdXQgd2hpY2ggb2YgdGhlIGxvYWRhYmxl
cyBpcyB0aGUga2VybmVsLiBCdXQgCndoYXQgaWYgdGhlcmUncyBhIGxpbnV4IGFuZCB1LWJvb3Qs
IHdpdGggZGlmZmVyZW50ICIvY29uZmlndXJhdGlvbnMiIApub2Rlcz8gRmlndXJpbmcgb3V0IHdo
ZXJlIE9QLVRFRSB3YW50cyB0byBzdGFydCB0aGUgbm9ybWFsIHdvcmxkIGlzIGEgCmhhcmQgcHJv
YmxlbSB0aGF0IHRoZSB1PWJvb3QgaW5mcmFzdHJ1Y3R1cmUgaXMgbm90IHByZXBhcmVkIGZvci4K
ClRoZSBzb2x1dGlvbiBJJ20gdXNpbmcgaXMgdG8gYnVpbGQgT1AtVEVFIHdpdGgKCUNGR19OU19F
TlRSWV9BRERSPVtsaW51eCBlbnRyeSBhZGRyXQoKVGhlbiBMUiBpcyBpcnJlbGV2YW50LgoKQWxl
eApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=
