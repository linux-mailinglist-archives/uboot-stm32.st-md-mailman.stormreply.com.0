Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 792ED84CE7C
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Feb 2024 16:59:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A063C6B476;
	Wed,  7 Feb 2024 15:59:58 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00CBDC65E4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 15:59:56 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d09d90fa11so8733301fa.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Feb 2024 07:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foundries.io; s=google; t=1707321596; x=1707926396;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7SJHLsmyLsnpYTs8F7PX+NqDAOEwtxkarApSiQwuPiY=;
 b=ESE4UsowoISdUSc+YCSfBaB9BRgCwg218wQW0MH29aLHwFTMJ06mcH21S2+N1IPzk5
 JTiKdilvvpe8tFK5+OZfe9gtBqb5Y8PYiZsVu7MgkC2c+Q7GD0JXNPB4CbSVU952J3ZS
 8OIgTV1d83FrfSn0bZg+I+uXjsAsVgUr9AJiwrUTeP26xlpn8XMAYQR5DVG9MRNNSKgP
 PIiQu66r0iQ6UJTEidRL9pqmf8kRyO7iUkAhBwue2m783uqt1p0DxM6ExVHnGuUASygZ
 SMse2noHW1n9THah4eYLWFFC6e9KmGejqlIBH5DP4BXMHjqvAROivk0y0k+IEb9rKb7M
 zC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707321596; x=1707926396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7SJHLsmyLsnpYTs8F7PX+NqDAOEwtxkarApSiQwuPiY=;
 b=jNEkfdTbsgniqvuUMl+Yr06O9BMS+3oBzVM6s6DPYDPmtLlb03Vm15bSp7j/ZHPd4W
 VUKSSsbX6ry7HQ8iAIOcHjHxxVWf4+aGnSx7LGEULH37paEzQ7I2kr1QlYZUzyEejgEx
 dZBWdntbGAEtPy5ImhuUKKZuKXtfrhT22DmAcYiXqvSpCUevSxUW21GorulReOZ5/NQU
 HL4687Bw2AvfhCUgwMNtBQA2UNGnlMtqMXP44qmSJBRR71abo6ANzVs5T2oe4JnOmPlG
 64OlHZ7ImUL+y0jW4W5TSB1cOc8wPjJogApEvS+MYFP0K8jAhmRt0c2vUdGuTdp1xhX6
 13Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEf6giwli8JCv8WEcR9Bakx/qsk01TcGz/ElPXpyBcsiwkwW/tcdm0SZ0Kmtb4+9YbuZZqAmBqy9Py3KlPJFAXrE+uE8F7LA87eZr8kD42sLm2alCcBp6H
X-Gm-Message-State: AOJu0YzT1bMqH0kHtmWYyrKfIKuARuSnBcyM9MRdNq+6VeTZJtY3WHeQ
 4yyGBATvkVdpUSt7iRGOf2El+rOct4NvYHgRaEl3ESP0aHUo2x6my5ST8BfLIYCmxA7dqAKJfI5
 8Nmw7huOPzs3GgOe6uG0Ro9SsRpe+E2kA88XlSg==
X-Google-Smtp-Source: AGHT+IHq1aUkCSt4SaLiUsa1TfaGHfnY/2fgMDYUTRARt8scfSxnI9Wv0IXnZQNUnYAgIFXhFSvGTnK2rQXqyATChbY=
X-Received: by 2002:a2e:b60a:0:b0:2d0:a6ef:651d with SMTP id
 r10-20020a2eb60a000000b002d0a6ef651dmr3922782ljn.47.1707321596144; Wed, 07
 Feb 2024 07:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20240207141154.1.If0aa2d32c2ffde32ed1d87ab8a088db67bc2d25c@changeid>
In-Reply-To: <20240207141154.1.If0aa2d32c2ffde32ed1d87ab8a088db67bc2d25c@changeid>
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Wed, 7 Feb 2024 16:59:44 +0100
Message-ID: <CAL6CDMHrdnw1yZ6gB3ZQz-ivVERiMExnzfhPUjrLBC9-9dcFVg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: cmd_stm32prog: add dependencies
	with USB_GADGET_DOWNLOAD
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBGZWIgNywgMjAyNCBhdCAyOjEy4oCvUE0gUGF0cmljayBEZWxhdW5heQo8cGF0cmlj
ay5kZWxhdW5heUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGF2b2lkcyBjb21w
aWxhdGlvbiBpc3N1ZSB3aGVuIENPTkZJR19VU0JfR0FER0VUIGlzIGRlYWN0aXZhdGVkCj4gaW4g
ZGVmY29uZmlnLCB3aXRoIHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gcnVuX3VzYl9kbmxfZ2FkZ2V0
IGFuZCB0bwo+IGdfZG5sX3NldF9wcm9kdWN0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBE
ZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAtLS0KPgo+ICBhcmNoL2Fy
bS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJt
cC9jbWRfc3RtMzJwcm9nL0tjb25maWcgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMy
cHJvZy9LY29uZmlnCj4gaW5kZXggOGY5MWRiNGI0NmI5Li41ODkyNzYyODJlNDQgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvS2NvbmZpZwo+ICsrKyBi
L2FyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3RtMzJwcm9nL0tjb25maWcKPiBAQCAtMTcsNiAr
MTcsNyBAQCBjb25maWcgQ01EX1NUTTMyUFJPRwo+ICBjb25maWcgQ01EX1NUTTMyUFJPR19VU0IK
PiAgICAgICAgIGJvb2wgInN1cHBvcnQgc3RtMzJwcm9nIG92ZXIgVVNCIgo+ICAgICAgICAgZGVw
ZW5kcyBvbiBDTURfU1RNMzJQUk9HCj4gKyAgICAgICBkZXBlbmRzIG9uIFVTQl9HQURHRVRfRE9X
TkxPQUQKPiAgICAgICAgIGRlZmF1bHQgeQo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICAgICAg
ICBhY3RpdmF0ZSB0aGUgY29tbWFuZCAic3RtMzJwcm9nIHVzYiIgZm9yIFNUTTMyTVAgc29jIGZh
bWlseQo+IC0tCj4gMi4yNS4xCj4KClJldmlld2VkLWJ5OiBJZ29yIE9wYW5pdWsgPGlnb3Iub3Bh
bml1a0Bmb3VuZHJpZXMuaW8+Ci0tIApCZXN0IHJlZ2FyZHMgLSBGcmV1bmRsaWNoZSBHcsO8c3Nl
IC0gTWVpbGxldXJlcyBzYWx1dGF0aW9ucwoKSWdvciBPcGFuaXVrClNlbmlvciBTb2Z0d2FyZSBF
bmdpbmVlciwgRW1iZWRkZWQgJiBTZWN1cml0eQpFOiBpZ29yLm9wYW5pdWtAZm91bmRyaWVzLmlv
Clc6IHd3dy5mb3VuZHJpZXMuaW8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
