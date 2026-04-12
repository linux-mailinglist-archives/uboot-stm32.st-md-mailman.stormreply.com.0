Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Fiw5OKv822kYKgkAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Apr 2026 22:12:27 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 689543E5D39
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Apr 2026 22:12:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A8BFC87ED1;
	Sun, 12 Apr 2026 20:12:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EA78C87EBF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2026 20:12:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43d01d6b50cso3760939f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2026 13:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776024744; x=1776629544;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D1XB+h1qqYqpT50eRwbAokQi0YxnIdNg27stw8IAQds=;
 b=TZiVNS5j9Xt3msq1S6Nf5L59RK90Sng4lxBNbC9LPLdCP6AJO3JYSdRuoGohyme3hi
 DhE6M/dzOPGMloqDHFGUVaAhp2MqMvlU+5rBiWgVblBqSOWqDG6P3ivaDzsCKXrAi+WK
 aMmljjf8IPP6+yL9+x3GrkIP96qo+/uvMEUmez+uqrcUhrMg38U6H0f/u3xyodkY8Rou
 1QisQl+WeMd6fsw3RRHwPQHwVd4uZQVmSnCkvduIbDxj3+6d3Oyqq/hA8ZW97QaR/Bo5
 SKWy5aLJlBl0EVERyKR29/jABnu1W5zTpI8VgOb1lDVZaEIk1WU5hnpmWqL1Ycb48VKY
 5E6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776024744; x=1776629544;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D1XB+h1qqYqpT50eRwbAokQi0YxnIdNg27stw8IAQds=;
 b=guPHCf+82e6xeiCUzMl3RcU7ATLllt/15bjnFC64Bjkrzbmew0bePcJg8RIqH0YOTz
 JuuRGUoOo2YxyD7wdwgVPucTN52B5S0FnjpHifHaOQJGC3Ru+9h9fmRnsOaWdc/5ysie
 sb11m39evm3aIWJLEVCthOBIklWgza+fbnf3JXqU77w9WgZ6M84EvMwyv3tKPEyHCwUI
 JNoRrFIOMgT0Bb7P0onsaLG4ojcDSIu0TafKGYxGlM4hAlLpoIzc4HzpnfF+3JU6Czj4
 wtPzmUMgbCL59EDnF+9cECeEhDwNVXVHT3LouuNviFdvBUUUb65aeMEA92uayJ8IwtVz
 bPbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/5Vb1n8z5zBTG5V1Wvth83a+mHV9mtUZRfPgGL1Sfi6mCgnHPbwHe75TRULX2m+k6lS48Q2Is00R2UCA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywozz6ABkv1gXUohZAOriRLauoKMSAFtAGHmrHFbBzyRxNHIiU/
 GcGbDhIlUDuSPTZBuPGb91EMZigWxaESoZ05se7G5XEke/zLLoL3xtGd
X-Gm-Gg: AeBDiev6LdR+aVtTPSPFrLYz/rI5YjkZru9qNq0rZM2oHVyqB1tWoPgg/N1y76uOymj
 JFf/pTvePvCEDtYZ7cTn6YBMjJfv0WbftEvq9HSkvqciaSdo3YamC8XsCR65WH33MZvBvWB4/7i
 ON2Fs5ASYV7mtqUe1jGhY8G+33gT6gPd5joPJqX3awUTS8M1yGPwPyXS6nm0cSdXw+mPse5QIvB
 ee+8lonY4pQdx7/mbFFZE1TQDPOyvuXlPCOUlWDKYfDXRjj8yaMGW7oQevjakYwHOy3vskh2BYE
 ISnaW41edn3Ms7vlkc6+eK/EoLeWGCtatOYPQcUVOYVzDLbyfhkAzgtfjKRPD+sK392a57xvGen
 BIPMBJUQF7n3hta3Ud/vG6rNwQUQpqPlf4ePTj1GBE0ZRlnbiW1t29LhmZS0+iw4dd8KTUsKCcb
 Gj+CCZJ1yV6tuwlXM6l2D4dC3nR+26CXWZ41XHPJMRp6k8d/16JGe81w/fNPs6ANPGAKA+yWU=
X-Received: by 2002:a05:6000:4285:b0:43c:4810:dc4a with SMTP id
 ffacd0b85a97d-43d642d3630mr15654266f8f.38.1776024744370; 
 Sun, 12 Apr 2026 13:12:24 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:f99c:d6cf:27e6:2b03?
 ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50200sm26915884f8f.29.2026.04.12.13.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Apr 2026 13:12:23 -0700 (PDT)
Message-ID: <c4b646c5-7038-4fd8-b794-f304502452c0@gmail.com>
Date: Sun, 12 Apr 2026 22:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
References: <20260401-add_stm32mp23_clock_support-v1-1-ff5fa33d8b67@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20260401-add_stm32mp23_clock_support-v1-1-ff5fa33d8b67@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32: Add STM32MP23 support
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
X-Spamd-Result: default: False [1.99 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:nicolas.le.bayon@st.com,m:patrick.delaunay@foss.st.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.707];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 689543E5D39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpPbiA0LzEvMjYgMTE6MzQsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPiBBZGQgU1RNMzJNUDIz
IHN1cHBvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAZm9zcy5zdC5jb20+CgpIaSBQYXRyaWNlLAo+IC0tLQo+ICAgZHJpdmVycy9jbGsvc3Rt
MzIvS2NvbmZpZyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKUmV2aWV3ZWQtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyZ2FsbGFpc3Bv
dUBnbWFpbC5jb20+CgpCZXN0IHJlZ2FyZHMsCgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9zdG0zMi9LY29uZmlnIGIvZHJpdmVycy9jbGsvc3RtMzIvS2NvbmZpZwo+IGluZGV4IDRlNDg4
MTM2ZWFjLi5lNjMzODVkMzA1MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9zdG0zMi9LY29u
ZmlnCj4gKysrIGIvZHJpdmVycy9jbGsvc3RtMzIvS2NvbmZpZwo+IEBAIC00OSw3ICs0OSw3IEBA
IGNvbmZpZyBDTEtfU1RNMzJNUDIxCj4gICBjb25maWcgQ0xLX1NUTTMyTVAyNQo+ICAgCWJvb2wg
IkVuYWJsZSBSQ0MgY2xvY2sgZHJpdmVyIGZvciBTVE0zMk1QMjUiCj4gICAJZGVwZW5kcyBvbiBB
UkNIX1NUTTMyTVAgJiYgQ0xLCj4gLQlkZWZhdWx0IHkgaWYgU1RNMzJNUDI1WAo+ICsJZGVmYXVs
dCB5IGlmIFNUTTMyTVAyM1ggfHwgU1RNMzJNUDI1WAo+ICAgCXNlbGVjdCBDTEtfU1RNMzJfQ09S
RQo+ICAgCWhlbHAKPiAgIAkgIEVuYWJsZSB0aGUgU1RNMzIgY2xvY2sgKFJDQykgZHJpdmVyLiBF
bmFibGUgc3VwcG9ydCBmb3IKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogYmE3YmY5MThkYWZjZDA5
M2FkNzMzYjA3YmE0OTBiYWViMjBjZjVkYQo+IGNoYW5nZS1pZDogMjAyNjA0MDEtYWRkX3N0bTMy
bXAyM19jbG9ja19zdXBwb3J0LWJiMTQ4MDkxNDgxMQo+IAo+IEJlc3QgcmVnYXJkcywKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
