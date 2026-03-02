Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC1KJJO5pWmoFQAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 02 Mar 2026 17:23:47 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8C1DCB9A
	for <lists+uboot-stm32@lfdr.de>; Mon, 02 Mar 2026 17:23:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99183C35E3C;
	Mon,  2 Mar 2026 16:23:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCF23C35E2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2026 16:23:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so38831875e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2026 08:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772468624; x=1773073424;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NQiaIkD0Xucvghuix62C/hLs4g3HxkTwiG5Td5ptXaA=;
 b=MVkwz1htVVc//0UgOK057xQS0JNH4g5kGOmdZREUQKKj79E/76l3u17UlNrrt4iDer
 z+PfaiMVLMI0TeMaLZac85/ft2WXQ8QTxgRb7n2ec9TkPcNBecLSRO+TKKgVOcQwGOsq
 2ELz8Cs1fJeXGxjq0GXRybxTCrxhMtOdKxBy4o/+X/D5pQ+kKHQUT6n0J0i9IrUTH4RW
 omXEudmB371CYmYfTGVemKzB4X4yBOW9jdlJyIoYIUD6NumDxRj0E40+lDcKJTpY3vAY
 ZfpcVVnH2I3Lns+c2y6WD57dfWoeAdumi7wJqe5ThmaLojnkRHkQJ3P8TTtieX/OwotF
 uuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772468624; x=1773073424;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NQiaIkD0Xucvghuix62C/hLs4g3HxkTwiG5Td5ptXaA=;
 b=HxTJOMiZTciiYo9Dy6/OcNdsN7JLZuljz/nFzbXCcKirWXuxi/bLKSjHXFAwojiPd3
 z1m03Sw4SCsA4AR9UwOGS4oCVoB4e/GM8YeTopK2EiEHUpaANWpGIqGe8lS1jt3UvGgT
 eF8OirXMhqrCjsJK1mrrdQ98LQcru7f4HsM6hleuXfdqdVvhy+Xfl0Tc3nX58FhieZjD
 M/Lvws6q8kxkvubQ/CB1jc92h3tk63nObaRKKpn9yOSVsrPr9ahTtozQYkykQjfve+BW
 ZY7rTdp8DQ7MwMt0tfUVgWOn+5sZDfsOdEiG8DgVYVG/Gm4WXopXc9sagJUL/4sV9uNd
 gffQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ9ClxyIePOW1SzUPvxkbUz7uCS/t/RKG3mSwCDBAXCHFZ19CS8ZCRvh56aNaYAGfs4WWGJZ/suaONcg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwQTnGapvaJLyswCDGzRDgww7z6HITb8wvtFD2AJuMNMGktFRjG
 bXFAuTkFTg2lLAYOQpWr/Bgi3etbT/Mefue9pnH/y+FUd1+gM17XHMSn
X-Gm-Gg: ATEYQzxppD3QsJMvPcOIs5UluJL5tNgAGnp26+T8CHJckYB0NSRfTPSB2sHAIVs8ydX
 sckQFDcJXYDW8OXqdHqPZjALROnyewKBBN1DjC4HgPZTGw9Cx2OpiV9UWUrF03B7FR8kydw3cCA
 igJafT4pwbnd/cAvO+cWNFs3rI6/sDd35FqIngqAYh1oDBbgbEVWdWvBOfqAAfEZYVKlG4jLw3y
 zCvoIgI908vcqy/O9IF0oFMMZVkrr3weO8iVnAlhAx9gnDf2RCHPgH2f1chculExrjSlhtDzsHb
 N+3dCDdbONc/OusCmmTazJLFWoG5z8z92yWiLTi8DasDeSSS4wV4r4EMgerlcF4sSyuK/ZFTi7+
 qKYH7y5IWTYNVDIiIh8mbCKLR0+klQTvFZTNQ6aadOQU/YpslDX3sQMIESF4yQOCfkOBt1x1UfD
 Q4osUq/zaRcV0qqFRfkJ81kaUy182y+n3ffWaOFTaUZ5xKM2pV1V5B5zEyAh/hxw/Ckd1ir11fw
 tgLJih30A==
X-Received: by 2002:a05:600c:8108:b0:47e:e9c9:23bc with SMTP id
 5b1f17b1804b1-483c9bfa168mr196055325e9.30.1772468623764; 
 Mon, 02 Mar 2026 08:23:43 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:f99c:d6cf:27e6:2b03?
 ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f26d7sm434625235e9.3.2026.03.02.08.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 08:23:43 -0800 (PST)
Message-ID: <beec85d9-a580-4ae3-854d-3c957b888eb2@gmail.com>
Date: Mon, 2 Mar 2026 17:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
References: <20260205-dsi-v1-1-eb5805068e97@gmail.com>
 <50a9f6c3-4284-460c-a429-49b4a53c836e@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <50a9f6c3-4284-460c-a429-49b4a53c836e@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: dsi: add .of_to_plat
	callback
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
X-Rspamd-Queue-Id: 2BD8C1DCB9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:ag.dev.uboot@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

SGksCgpDYW4gdGhpcyBvbmUgYmUgcGlja2VkIHVwIGZvciB2MjAyNi4wNCBvciBpcyB0aGVyZSBz
b21ldGhpbmcgSSBzaG91bGQgZG8gPwoKQmVzdCByZWdhcmRzLApSYXBoYcOrbAoKT24gMi8yNC8y
NiAxMTowMSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBPbiAyLzUvMjYgMDA6
MzUsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+IERyaXZlcnMgc2hvdWxkIGV4dHJhY3Qg
ZGV2aWNlLXRyZWUgZGF0YSBiZWZvcmUgcHJvYmluZyB2aWEgdGhlCj4+IC5vZl90b19wbGF0IGhv
b2suCj4+Cj4+IEltcGxlbWVudCBpdCBmb3Igc3RtMzJfZHNpIGRyaXZlci7CoCBCeSBkb2luZyBz
bywgaXQgYWxzbyBzb2x2ZSBhCj4+IHZhcmlhYmxlIHNoYWRvd2luZyBpbiBzdG0zMl9kc2lfcHJv
YmUoKSB3aGVyZSAmY2xrIHdhcyB1c2VkIGFzCj4+IHBlcmlwaGVyYWwgY2xvY2sgYW5kIHJlZiBj
bG9jay4KPj4KPj4gRm9yIHJlYWRhYmlsaXR5IHNvbWUgc3RydWN0IGhhdmUgYmVlbiByZW5hbWVk
IHN1Y2ggYXM6Cj4+Cj4+IMKgwqAgKiBzdHJ1Y3Qgc3RtMzJfZHNpX3ByaXYgKmRzaSAtPiBzdHJ1
Y3Qgc3RtMzJfZHNpX3ByaXYgKnByaXYKPj4gwqDCoCAqIHN0cnVjdCBjbGsgY2xrIC0+IHN0cnVj
dCBjbGsgcGNsawo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyZ2Fs
bGFpc3BvdUBnbWFpbC5jb20+Cj4+IC0tLQo+PiBUaGlzIHBhdGNoIGhhcyBiZWVuIHRlc3RlZCBv
biBzdG0zMm1wMTU3Yy1kazIgYm9hcmQuCj4+IC0tLQo+PiDCoCBkcml2ZXJzL3ZpZGVvL3N0bTMy
L3N0bTMyX2RzaS5jIHwgMTY4ICsrKysrKysrKysrKysrKysrKysrKyAKPj4gKy0tLS0tLS0tLS0t
LS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKSwgNzcgZGVsZXRp
b25zKC0pCj4+Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2su
ZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
