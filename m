Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MjrDKnL8WlCkgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 11:13:13 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A52E14919F5
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 11:13:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B70C87EDB;
	Wed, 29 Apr 2026 09:13:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D5AEC58D7A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 09:13:10 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43cfd1f9fd1so7664337f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777453989; x=1778058789;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gi+bZQZZt2d+wVJGEgxth8N+mFQ6Yh00/muVk1rc3rc=;
 b=rZOAiUE/9YWFrDRTZV4+tnenxL65ei9So1+DpWMy7/Qkb6H/KvYwO9mIxoFKvZRyZt
 TR/jF86uAdEBY1lREjb2anaBzSBqEqvJqXBHGbaCeGHPrnVzvjYOCxhY3rWBMrnD3T3K
 4wrGU09NKVfZiL74PcI2wPmz6wsZZkhOSvCG2cBgRC7wn6OAFPf7s+kMO+BNKhnZlKDw
 c06umIwfZzkH9WVnQh4pKB9KYJTm1lVsG9rVUVml61pPotkVCmOlNJQTMOsAAJMk3wIN
 mLiDZTZysrZzAi+cw+aMAeln6bW0QbmLGtXvEbgZIbNqiHuKB9Cr/yHkZ0N5+tKKIZE5
 fUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777453989; x=1778058789;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gi+bZQZZt2d+wVJGEgxth8N+mFQ6Yh00/muVk1rc3rc=;
 b=KZfSb73J50axxcWC4HWAlVLfua13cOs+KhKgl5HWhYekp9LAhizwNq1YPourFx0O4t
 hMDyKjxAE7pbsEpom9jJ4kUHVa33xThWSH0R68GOjcbIAvJlh73qk18DtH0WQHCzsat/
 OgGJFINaqbEGkX385Yt18kdQoixn2mNp01fk/Kqzp1fWb0zmOdUiaLMCgbAcDiPjeDiZ
 F3M/Ym4+l4EuIe5TXAr52/hBynFstOwumQd8rYmcvNUQWjIqPA2LAu7weGqxq/xhpyoP
 FqoAKAK/mxdiqbCGnCYym8qeGOQMTn3VHeY7rKHKSudcCP4VXJYdZFoKQw+EBeKjDcLG
 rOww==
X-Forwarded-Encrypted: i=1;
 AFNElJ/DJceEvweeiP9wrAdl975JyetgaEB4yrlcFunNjHStbVJourzX06LW1yJN8zZ8u+syUcx4hRP9c3QnnA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxGPYZylQpAAbiDwYRDsgMmNYIsrMWBuuzrOcd1kfzSUKL4AjpS
 wdetUq0DSdp5tRYESxyQi210XDyKwMjltj8l2O7gZjlJ+jPdckNsRCU6
X-Gm-Gg: AeBDievaU8xktX1HrZsEMd0pdWUGhTW0/xtLWnIC22JVihdNU6+mnZx1iXJgMELFa7A
 NCJ2+hNB7TqJOlBaf5Ji25UyeqNRTxcaJ/EKD08a/cvv9JjAyVKz9YmB5T4Kju+IWnEDjK30BRk
 7vSw8jjFBYA6nEn9qwx9StPN4ARRUX3taAjZe7rhQKh0aZBH/3cSSXZF01ol4FoIqf7YmWu29hb
 huLYwvTKQ/leOYV7Rji2XgNzFJ5aBNj/sGahUtNPRSml90cnUcdsBPzx9rxqb8UuwtvQRF5TQRT
 K4iU2wK23tZdFT6slc9k/oxZ/syZB6ro0Bin7n3M8vFV1DtkUWN1SMMLXAmFKo39kV+9//snxHw
 0QpDLpUoEAjXDZ44tpqgAX5kSEgGpiEprBGd1vJ35AON9hLJTjP7U0D/zFcjsUu5eWbeSW//slT
 7z/dTB1QZeUsYmd+jrOrwerFvu4BFvTiMgojpJ+c33gokNBi2r28ZOL5KNlMwnGf6FWRBfyvWDC
 54XeeGGHA==
X-Received: by 2002:a05:6000:230e:b0:43d:7a97:78a2 with SMTP id
 ffacd0b85a97d-4464aced4b6mr13087425f8f.28.1777453989149; 
 Wed, 29 Apr 2026 02:13:09 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:f99c:d6cf:27e6:2b03?
 ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b76e5c22sm4314395f8f.28.2026.04.29.02.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 02:13:08 -0700 (PDT)
Message-ID: <255b4c39-eff9-46cd-9e18-8e1b47ecabac@gmail.com>
Date: Wed, 29 Apr 2026 11:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
References: <20260414-fix_usb_adc_meausurement-v1-1-8cdbd4c10dd8@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20260414-fix_usb_adc_meausurement-v1-1-8cdbd4c10dd8@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32pm1: Fix
 board_check_usb_power()
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
X-Rspamd-Queue-Id: A52E14919F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:kory.maincent@bootlin.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.889];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

CgpPbiA0LzE0LzI2IDExOjA2LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4gRGVwZW5kaW5nIG9m
IHBsdWdnZWQgcG93ZXIgc291cmNlIChjb21wdXRlciwgd2FsbCBjaGFyZ2VyLCAuLi4pIGl0IGNh
bgo+IGhhcHBlbiB0aGF0IHdlIGdvdCB0aGUgZm9sbG93aW5nIG1lc3NhZ2U6Cj4gCj4gIioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioiCj4gIiogICAg
ICBVU0IgVFlQRS1DIGNoYXJnZXIgbm90IGNvbXBsaWFudCB3aXRoICAgICAgICoiCj4gIiogICAg
ICAgICAgICAgICAgICAgc3BlY2lmaWNhdGlvbiAgICAgICAgICAgICAgICAgICoiCj4gIioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioiCj4gIiIKPiAi
IyMjIEVSUk9SICMjIyBQbGVhc2UgUkVTRVQgdGhlIGJvYXJkICMjIyIKPiAKPiBUaGlzIGlzc3Vl
IGhhcyBiZWVuIGRldGVjdGVkIG9uIFNUTTMyTVAxMzVmLURLIGJvYXJkLgo+IAo+IEl0J3MgZHVl
IHRvIG1heF91ViBhbmQgbWluX3VWIHZhbHVlIGFyZSBpbml0aWFsaXplZCBhdCBiZWdpbm5pbmcg
b2YKPiBib2FyZF9jaGVja191c2JfcG93ZXIoKSBhbmQgY2FuIHRoZW4gYmUgdXNlZCBmb3IgdGhl
IDIgaXRlcmF0aW9uIG9mCj4gYWRjX21lYXN1cmVtZW50KCkuCj4gbWF4X3VWL21pbl91ViB2YWx1
ZXMgaXNzdWVkIG9mIHRoZSBmaXJzdCBhZGNfbWVhc3VyZW1lbnQoKSBpdGVyYXRpb24KPiBhcmUg
dXNlZCBhcyBpbnB1dCBvZiB0aGUgc2Vjb25kIGFkY19tZWFzdXJlbWVudCgpIGl0ZXJhdGlvbiwg
d2hpY2gKPiBjYW4gbGVhZCB0byBpbmNvaGVyZW50IHBhaXIgb2YgbWluX3VWL21heF91ViB2YWx1
ZXMuCj4gCj4gVG8gZW5zdXJlIHRoYXQgYWRjX21lYXN1cmVtZW50KCkgcmV0dXJucyBjb2hlcmVu
dCB2YWx1ZSBmb3IgbWF4X3VWIGFuZAo+IG1pbl91ViwgaW5pdGlhbGl6ZSBtYXhfdVYgYW5kIG1p
bl91ViBhdCBlYWNoIGxvb3Agc3RhcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90
YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gLS0tCgpIaSBQYXRyaWNlLAoKUmV2
aWV3ZWQtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+CgpC
ZXN0IHJlZ2FyZHMsClJhcGgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
