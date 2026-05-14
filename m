Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB17GkjkBWoAdQIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2026 17:03:36 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486F543AFB
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2026 17:03:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0A16C8F263;
	Thu, 14 May 2026 15:03:33 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A3D1C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 15:03:32 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so51126175e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 08:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778771011; x=1779375811;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2HeGpSThbSFjGw84J67vea1Oozl9PNwEItQAB/hxVtA=;
 b=SrTe7GFoETLqqWX3QbzpD7rFGfHFNPesHdGk+p2E729xjIApXRCyL0BVA+mgYnJsE1
 PDQfJsY4eQfPMJqbxn6uxICBXkf2Z015xxJKraU9ImQ4SgIXSdGfSqMaAcFzi4vcu87P
 5n8zPXYwQQj91zwB3y6EdumMHtGDV5WTfvS+QS0EeQQK0t9oGtTJq2AUxZcFS7mYfNIU
 Jnp990HlQ4FL1UlJI17fKNUwoBXsNg6LdueDIyM2TXHqv1n96K7WdwtaMV9uO1ru9mtp
 cvU1+TrJeYRCcf2Em9v2SJKGZD5JeQjsivc506CHjr5HAI+vWOOFc0nSvlJYwqNDdMpt
 pIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778771011; x=1779375811;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2HeGpSThbSFjGw84J67vea1Oozl9PNwEItQAB/hxVtA=;
 b=HhGac4AvXi2K+RMYYXBbPjovodOiHZsgZPLJdITQur4YU6XSLVorNLxFRQAwKXk4h4
 /xU3mcAnzmMQbwaKb/WyVTicuh9/MBOScwtBrlNZ7aTMVVBjEbQF2mas8YhCBb0w1nLI
 +Qu8D1QZ1M+zY1OqPBux1s8p28TwaWf00ClaqxBLZEzlcT5Fv3qpqLGBI7Wku6AA5z6a
 r2VKP8ETFoxoeCi7PVRyO2EStbPwmHNrvLUcLtUMtPvnAP+KEIbtj5HXo3RRbHoXrr79
 0znvP+f4ZZetrz++azY3ZthLAF9yMgd3RL8ErTJCtJh6TBa0lPySrRjeN375QoCa7OHv
 6M+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+xZ08AgYnsyPJroUGmGuaFXNwa4pFKFx6YqepNqCDp/6t9SFkprldHFgMTk+ZDV22TcwXsrMHwMi7x7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxCcOce6Cl/A5mfkkmFyyFZJZiDfBlc8B5SLNogqu7piFLM5WyK
 HgSFNwuROB4uBJiGBy99QH+mFPMDco8YL58fz++4XoOfj8jPStOuNFpz
X-Gm-Gg: Acq92OFk6nwLy7gme8nxXlH3rVZJg201Z3SbSGYngLn15wHNumnKGMrkaE9rCDpqDdp
 yUcWUcCAxGIE+JAmDKzrYFp9ekz3cOKVpkvX4S9pjHwXg+WrAk21hYKCMnJy6kJDUJlk3jyF0qQ
 qNzCkPa16oeY+kB8QMRxqbkX/GBtks2xwEvo6cDbRt9U+83YjxmlPUQWawNhCgU49qqVkzfwYUr
 JMeWdOuKktM+LWBSdRSavbGSQ/scML1hbyS2gKobGPuVAs2m+VyVarPV2Utww/CUOhGFJ/35Vhq
 YZA0iDGgR51ifIGomhjMxkiKhfZ3Fc38z5woT0vntdQFEQZwqjY1FQX/MyZQu1jSra34VnvNu5l
 d+ypeXKeHB6Zqrz44timSJL5THKMpQ6cPiHRjQVb3Zf40cu1Ajj61JQj76f8UbHQhSmEX1uIRzA
 2hl4G9onkMpH3XDhPCIdj5kCo2eACZXbBmORAoWvuwU07CcqBfmq8T+H+k+tdTl5zx5SuwZzU=
X-Received: by 2002:a05:600c:4fcb:b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-48fc9a0ebc2mr120926805e9.8.1778771011273; 
 Thu, 14 May 2026 08:03:31 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:f99c:d6cf:27e6:2b03?
 ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd769141fsm20252065e9.32.2026.05.14.08.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 08:03:30 -0700 (PDT)
Message-ID: <8bf4666d-c168-4bf4-a079-7b41b3af2534@gmail.com>
Date: Thu, 14 May 2026 17:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, u-boot@lists.denx.de
References: <20260510171723.56866-1-marek.vasut+renesas@mailbox.org>
 <20260510171723.56866-9-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20260510171723.56866-9-marek.vasut+renesas@mailbox.org>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 09/11] video: stm32: Staticize and
	constify driver ops
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
X-Rspamd-Queue-Id: 9486F543AFB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:ag.dev.uboot@gmail.com,m:marek.vasut@mailbox.org,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[foss.st.com,konsulko.com,st-md-mailman.stormreply.com,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.584];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[denx.de:email,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

CgpPbiA1LzEwLzI2IDE5OjE3LCBNYXJlayBWYXN1dCB3cm90ZToKPiBTZXQgdGhlIG9wcyBzdHJ1
Y3R1cmUgYXMgc3RhdGljIGNvbnN0LiBUaGUgc3RydWN0dXJlIGlzIG5vdCBhY2Nlc3NpYmxlCj4g
ZnJvbSBvdXRzaWRlIG9mIHRoaXMgZHJpdmVyIGFuZCBpcyBub3QgZ29pbmcgdG8gYmUgbW9kaWZp
ZWQgYXQgcnVudGltZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZWsudmFz
dXQrcmVuZXNhc0BtYWlsYm94Lm9yZz4KPiAtLS0KPiBDYzogQW5hdG9saWogR3VzdHNjaGluIDxh
Zy5kZXYudWJvb3RAZ21haWwuY29tPgo+IENjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hv
dGFyZEBmb3NzLnN0LmNvbT4KPiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5h
eUBmb3NzLnN0LmNvbT4KPiBDYzogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VAZ21h
aWwuY29tPgo+IENjOiBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPgo+IENjOiB1LWJvb3RA
bGlzdHMuZGVueC5kZQo+IENjOiB1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCj4gLS0tSGkgTWFyZWssCgpSZXZpZXdlZC1ieTogUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJn
YWxsYWlzcG91QGdtYWlsLmNvbT4KClRoYW5rcywKQmVzdCByZWdhcmRzLApSYXBoYcOrbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
