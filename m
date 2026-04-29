Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD6EGDy48Wk1kAEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 09:50:20 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F028D490C20
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 09:50:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FF37C87EDB;
	Wed, 29 Apr 2026 07:50:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 129E0C555BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 07:50:12 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so148971345e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 00:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777449012; x=1778053812;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DJVaKce2aDYO6BmURt4xDZlPU6iVmCVIj3g8ExW4eRg=;
 b=SkNsA7xgiV+JFW0fjX44T9j9OKefLuEgWEUM3pMBXNrIJ1xh1TvOROP5w8CNBpa6iN
 TqJZl1OvqD5AI98L8KjPxrOt0sdQXssk1zpJmE2Nz1Fo/mWpfTjLN8tXfqT9eR4DqNYx
 oUu9I8C9mKm7R7/Tq095W1d75QTpFkHFcjSXmsGabfFAPecHWnqc8zzwKJs7Fe+rpQde
 8/eQfpr4fRLYhpXY8mwNT0ZdgHkLPejg8MR7ZxNB0kdtg4xf03PXSoEyuOfPkhWuRi8l
 mgBlGP0w+zrK3PCPsAB446oZuguA7oJdDa811YXI7yqIN5MVUqn3XkQ7ppqJI/Cathkw
 us9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777449012; x=1778053812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJVaKce2aDYO6BmURt4xDZlPU6iVmCVIj3g8ExW4eRg=;
 b=GhX/83vcE3SAXhqb4OYbcohkvCzOVyhavFGCAHP1I+Y277++KwK3XxrOCvdVt7Nw7/
 6mOGLhqdJB9LOPzjy4UYQ5q50gE5F6a85Qw3vG5YVp9mTaIgEKo/NtwQ/c3O/n9Q0fUt
 XoaVaytq8GLC0vkUIs8V/SbCpoj9cekcBCUd5fye4xXLTEWom0s9W9zpdV7nnTXw+C34
 Q6IAvOyBF5ON+hPhmhJv7GuOIpQnEAg17oim4fuTT3QcvWddFGki4aChSKTb0k+9zcxW
 lhWpV0AYU3gP2Vj0TrC+ksL5m87iMlXAhF3qo6C+qd11sENdMB0If5Y9pMfSgUQQ8qUP
 IjEg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+X2zmUAyaIsvBL/eE7yPLDq2uYRP+P98/nGQK5c8S+MFAK4z3VyF79zL+IAW3rg660uwQ6elzz9McfPQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTIN/SrmuU/ebyuRbdVC0R6uF5Ojd0llpz1SCNKfuw7TR7Vj1s
 pvrx5OHh1eY5bJJY56r9X7yc6mR5DnLQ9GmaHbNRlnMQydHTXglMf5IgV48Cuw==
X-Gm-Gg: AeBDiesw8kNEP3xp1ADzri0Af4d4YkAXjmcZ0WeKez08JSG724g/ctjq6OV6pAbjRr8
 ZquzGsEnyd3e/fXGDyYYkQIau/Kd4vni3JOAddG6pJ+bFS3Vlix/5foZal4VWmM2JqDyxXK7rDe
 dQ4/EoUgjy1bvil0RYT8mLRRa5dghxqCFXWFYS/7ChiWwD3XtxJvK9TU8YbZwWzGUysyudwcp7J
 M3K2bHlyuTKRq7znAurX7euEWa3fBFl57ZnE0+rjlekKX038W+qVTioV2P+BoYctrLqAFUI5Iji
 GZtxBdGXfDnZgRaapn+J9mOCfcrTq1RhYGn52DhQBWikgQb4OnfkonpGTr5+yjISiHxsuU+uZVO
 vIXRirh5OXj7S5vBpTlYTtO4Xffe3FOcSlVHialzWf50JAk1wgYd74Iv3dpmdUs2kHRylLt00NZ
 uvEucPsWcZpwaJlGpF5mXHk00ZFh7Xd6t/TkvWmaatKJD6Ht0y6TVNmpUosONAtCW7Epen0qhue
 XD17O+RwQ==
X-Received: by 2002:a05:600c:354d:b0:488:bc6a:528d with SMTP id
 5b1f17b1804b1-48a77b19c82mr104652945e9.22.1777449012144; 
 Wed, 29 Apr 2026 00:50:12 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:f99c:d6cf:27e6:2b03?
 ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a7c5c740fsm31313655e9.12.2026.04.29.00.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 00:50:11 -0700 (PDT)
Message-ID: <488f6f98-762e-4104-96f2-60a2475585fd@gmail.com>
Date: Wed, 29 Apr 2026 09:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
References: <20260428-fix_mp21_reset-v1-1-d1f2dff3f507@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20260428-fix_mp21_reset-v1-1-d1f2dff3f507@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] reset: stm32: Fix compilation error
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
X-Rspamd-Queue-Id: F028D490C20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:marek.vasut@mailbox.org,m:gabriel.fernandez@foss.st.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.082];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MAILSPIKE_FAIL(0.00)[52.209.6.89:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]

CgpPbiA0LzI4LzI2IDE4OjEwLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4gVGhlIGZvbGxvd2lu
ZyBjb21waWxhdGlvbiBlcnJvciBvY2N1cnMgd2hlbiBlbnZpcm9ubWVudCB2YXJpYWJsZQo+IEtC
VUlMRF9PVVRQVVQgaXMgbm90IHNldCA6Cj4gCj4gZHJpdmVycy9yZXNldC9zdG0zMi9zdG0zMi1y
ZXNldC1tcDIxLmM6ODoxMDogZmF0YWwgZXJyb3I6IHN0bTMyLXJlc2V0LWNvcmUuaDogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAgICAgOCB8ICNpbmNsdWRlIDxzdG0zMi1yZXNldC1jb3Jl
Lmg+Cj4gICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBBcyBzdG0z
Mi1yZXNldC1jb3JlLmggaXMgbG9jYXRlZCBpbiBzYW1lIGRpcmVjdG9yeSB0aGFuIHN0bTMyLXJl
c2V0LW1wMjEuYywKPiB3ZSBzaG91bGQgdXNlICNpbmNsdWRlICJzdG0zMi1yZXNldC1jb3JlLmgi
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZv
c3Muc3QuY29tPgo+IC0tLQoKSGksCgpSZXZpZXdlZC1ieTogUmFwaGHDq2wgR2FsbGFpcy1Qb3Ug
PHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KCkJlc3QgcmVnYXJkcywKUmFwaAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
