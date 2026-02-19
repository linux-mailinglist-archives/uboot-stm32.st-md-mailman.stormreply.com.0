Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEl/E/1Zl2lPxAIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Feb 2026 19:44:13 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDEA161C53
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Feb 2026 19:44:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CD78C8F273;
	Thu, 19 Feb 2026 18:44:12 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFFFEC87ECA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 18:44:11 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-436234ef0f0so871239f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 10:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771526651; cv=none;
 d=google.com; s=arc-20240605;
 b=TJ/hSSwQoS2oaE0z+/57XpmBz7Z/YZAYo/Q/JEB5ACzImqBkms4ePzSnSJ79g6aANK
 EKUq8clN//hLRgo6hzZgZn1xPDY0SFzf5yc/imwwI9K4WkbfeX2Xuwg5QXJ0NF+98rBj
 Pj/di8wXq6lW+MJ/E5qmvRyBf3sOdCZm6298CMMkEzcFYVUnB5Tr7Rv2wTAMCQidfhFn
 Fd62nCrfTF/Wp635lsIlAooLheveWVDV52B3Y/W+r1d1EB9bzbgsBu1IatFXYTKG4A2Y
 eS1uYxI2Ho+FD7gvo11lpFbu+MLoWhjSPt7jQhVaahXGVjcGVqKJ5GCsSnFmDaB8HGxG
 qFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/Zq3DNaPwP0vy1/unaMj5K20rAFP9lqxMwXmJTi2J3Q=;
 fh=6jIvXAFD+JTJoQvdtJoRvtUa0wqwoZEYq/CqczZux84=;
 b=lUAYEHs3BDB+s6sSq7F2NDXXoAJHB0cqlChoZoClEb0UnRhEKB4npWj2qYdeLE8bqN
 dT5tWiagbtGX4eNqbtSuZlxP/HPUgej/MPzKIymhe5wGX7EuETIgLU2IL259i8cHTNxf
 PzClvDglt6uIOr/bwmf8Z/d39qqp4nBL6bQMVZNEp9NJSp7RBZfuw3EA3bzOcyGbEXJj
 pHIX9fKiS+WBBekyNqyH+6RwyUt0RLCrqMX40X7wqqRzj/JBfNgpZnqFbuI0hbuTXxvk
 gSJLCpQXFW5qY3fH/CkxcjBJuutd9w0Uc0Qk4iDl0RXyu/EMBOlf2jClPI7+2RXq7cLa
 PGOg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771526651; x=1772131451;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Zq3DNaPwP0vy1/unaMj5K20rAFP9lqxMwXmJTi2J3Q=;
 b=I/RnuH2PCcSJXFp1KPPZZpejzZaqUBuV4r+rgO+TzbRZtBVFcwjo0Fwa5g8bDLVJ7Q
 kvcbMyShZQIqL4O3bBLYJ5169eWrFu/RC7XXAsXkpy9KVVtUiTFzFmitJauyikqcvftK
 jUxKkCyVLfBp+94U/A+hOFKlfTqTbGDB9Q5+I0ESWMjBlbmJFsu9TmgwvGCbir1VjK2S
 vj0BB5MhNLwv+x78N0dmIflnq1jg6It+14cWXTv3Rz5tyHqk52mMmNbUiOxUgE897I8l
 qRQ5jhalytlMp4+PrM8zmJlF7U9w43eG8TROWmjpjHKSTY6N+xZ/GoMuAWfFQuqUKpuU
 lvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771526651; x=1772131451;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/Zq3DNaPwP0vy1/unaMj5K20rAFP9lqxMwXmJTi2J3Q=;
 b=A/tPL5rUQiy+LNp27OETAe2O56D44szUBsDiJNysjm+FH+0FfpxEEWzLEfYrjzeFjc
 TLXy7/sgifgtmM4z+rjFBnNIJo3DrLI7pmf5SEWCdo94Xe6DXBlGsN4vpCgUPp9xK6Vh
 0BdFw5Q+GQraOQam5F+1cf+R9IzPm43tzSstSnpOxXVZAhDfVn4YsSjPH1t6k3LA0zH4
 nEc+mHl/VUK73qJ+3v1RDFYrebcFWGuvg0cVAGvbaSv27tjPmXFU3c1W/MdmzSnUPpte
 18k7yIrYv/H4HLywLfYJEwLy0RDSw/GoZk/gfTIzMMDTu6EE7sgRumuJQZonnCgi4JCY
 CjBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRTYOTWYFgcinkzYfFng63qwjC3uyWm1R1QZsbL8zhtZ6AtsGe3PaaM2MgLl5zzoMAIXLQrdc/lCOlOA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxWCA2f2SSoW4hXmY5ZyPyjPdoE8yLqfKXUajUnHb48vxmRzq/v
 2Efu93IEbj5AKlbH61VDA6XQQWKFTgG66OiywvclgTSiuh+6LqGrFlLuRBR5GctXBLup7s6G+EW
 7TzoUZfCF8DICNnVOAqGipUcwLz5GJhg=
X-Gm-Gg: AZuq6aIOGxPPL/aQ6uzMaN9eVDCbvZdA7FbdHLXy70/TmzR3Xpy17ofycX/oSrfg8N7
 L6EqyVmRxxWsguqsFFo8ykDbHGaolqxRqU6ebJidNIJN1S8u0mqZDxysX0tHZts9BflMCAMa2E+
 UAV3fdYXlqRzkuPWLTTLRktNlrTzjoMW6HaGEKmF2HBahS+DeVjGrL2pWThoaDxx/KVE7KPd9ye
 G7b8iq7gq9bKsvpjvwqSP5dpqtdx7wtNNfMp2pMhzWpABls2T0GT+OkMd2VZBO1MGw3OLpJohVN
 6JaQFqsT
X-Received: by 2002:a5d:64e6:0:b0:437:7168:af50 with SMTP id
 ffacd0b85a97d-4395fd567bdmr6406953f8f.37.1771526650681; Thu, 19 Feb 2026
 10:44:10 -0800 (PST)
MIME-Version: 1.0
References: <20260219175130.2839234-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20260219175130.2839234-1-dario.binacchi@amarulasolutions.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 19 Feb 2026 20:43:59 +0200
X-Gm-Features: AaiRm50moCKelt8X3yQGm2Bq93raX6L6smZ7BiwSEIveJ7BveiGb0s296IYUrTI
Message-ID: <CAPVz0n3E-v5EZ8THu76dXUeERrq1MCFyReib5rS9N3DV2Tkidg@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Tom Rini <trini@konsulko.com>, Andrew Goodbody <andrew.goodbody@linaro.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Simon Glass <simon.glass@canonical.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 u-boot@lists.denx.de, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Ion Agorria <ion@agorria.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, linux-amarula@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 0/8] video: support Rocktech
	RK050HR345-CT106A panel
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[clamor95@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:trini@konsulko.com,m:andrew.goodbody@linaro.org,m:ansuelsmth@gmail.com,m:xypron.glpk@gmx.de,m:sjg@chromium.org,m:simon.glass@canonical.com,m:ag.dev.uboot@gmail.com,m:dsimic@manjaro.org,m:u-boot@lists.denx.de,m:alpernebiyasak@gmail.com,m:agraf@csgraf.de,m:ion@agorria.com,m:miquel.raynal@bootlin.com,m:patrick.delaunay@foss.st.com,m:pbrobinson@gmail.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:linux-amarula@amarulasolutions.com,m:jagan@amarulasolutions.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[konsulko.com,linaro.org,gmail.com,gmx.de,chromium.org,canonical.com,manjaro.org,lists.denx.de,csgraf.de,agorria.com,bootlin.com,foss.st.com,st-md-mailman.stormreply.com,amarulasolutions.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: BEDEA161C53
X-Rspamd-Action: no action

0YfRgiwgMTkg0LvRjtGCLiAyMDI24oCv0YAuINC+IDE5OjUxIERhcmlvIEJpbmFjY2hpCjxkYXJp
by5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4g0L/QuNGI0LU6Cj4KPiBUaGlzIHNlcmll
cyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBSb2NrdGVjaCBSSzA1MEhSMzQ1LUNUMTA2QSBwYW5lbC4K
PiBUaGUgaW5pdGlhbGl6YXRpb24gb2YgdGhpcyBwYW5lbCByZXF1aXJlcyBhIDktYml0IHdvcmQg
bGVuZ3RoCj4gY29uZmlndXJhdGlvbi4gVG8gc3VwcG9ydCB0aGlzLCBJIGhhdmUgZXh0ZW5kZWQg
dGhlIFNUTTMyIFNQSSBkcml2ZXIKPiAoaW5jbHVkaW5nIHN1cHBvcnQgZm9yIHRoZSBTVE0zMk1Q
MjUgU29DKSB0byBpbXBsZW1lbnQgdGhlIHNldF93b3JkbGVuCj4gb3BlcmF0aW9uLgo+Cj4gVG8g
cHJvcGVybHkgdmFsaWRhdGUgdGhlc2UgY2hhbmdlcyBhbmQgZW5zdXJlIHRoZSBTUEkgdWNsYXNz
IGNvcnJlY3RseQo+IGhhbmRsZXMgdGhlIHdvcmQgbGVuZ3RoIHByb3BhZ2F0aW9uLCBJIGhhdmUg
YWxzbyBpbXBsZW1lbnRlZCB0aGUKPiBjb3JyZXNwb25kaW5nIGxvZ2ljIGluIHRoZSBzYW5kYm94
IGRyaXZlciBhbmQgYWRkZWQgYSBkZWRpY2F0ZWQgdW5pdAo+IHRlc3QuCj4KPiBJIGhhdmUgZ3Jv
dXBlZCB0aGVzZSBwYXRjaGVzIHRvZ2V0aGVyIHRvIHByb3ZpZGUgYSBjb21wbGV0ZSBvdmVydmll
dyBvZgo+IHRoZSBpbXBsZW1lbnRhdGlvbiBhbmQgaXRzIHZlcmlmaWNhdGlvbi4KPgo+Cj4gRGFy
aW8gQmluYWNjaGkgKDgpOgo+ICAgc3BpOiBhZGQgc3VwcG9ydCBmb3IgYml0cy1wZXItd29yZCBz
ZXR0aW5nCj4gICBzcGk6IHNhbmRib3hfc3BpOiBzdXBwb3J0IHdvcmRsZW4gc2V0dXAKPiAgIHRl
c3Q6IHNwaTogYWRkIHNhbmRib3hfc3BpX2dldF93b3JkbGVuIGludGVyZmFjZQo+ICAgdGVzdDog
ZG06IHNwaTogYWRkIHRlc3RjYXNlIGZvciBzcGlfc2V0X3dvcmRsZW4oKQoKSGVsbG8gRGFyaW8h
CgpZb3Ugc2hvdWxkIG5vdCBuZWVkIHRvIG1vZGlmeSBzcGkgZnJhbWV3b3JrIHRvIHN1cHBvcnQg
OSBiaXQgbGVuIHhmZXIuCmRtX3NwaV94ZmVyIHN1cHBvcnRzIHRoaXMgYWxyZWFkeSwgeW91IG5l
ZWQgb25seSBzdG0zMiBzdXBwb3J0IGZvcgpub24tYWxpZ25lZCB4ZmVycy4KCllvdSBjYW4gcmVm
ZXIgdG8gc3NkMjgyNSBicmlkZ2UgYXMgYW4gZXhhbXBsZSBvZiA5LWJpdCBzcGkKY29tbXVuaWNh
dGlvbiBmb3Igd3JpdGUgYW5kIDE2IGJpdCByZWFkcy4KCj4gICBzcGk6IHN0bTMyOiBjbGVhbiB1
cCBidWZmZXIgbGVuZ3RoIGFzc2lnbm1lbnQKPiAgIHNwaTogc3RtMzI6IGFkZCBzdXBwb3J0IGZv
ciBiaXRzLXBlci13b3JkIHNldHRpbmcKPiAgIHNwaTogc3RtMzI6IGV4dGVuZCBzdXBwb3J0IHRv
IFNUTTMyTVAyNQo+ICAgdmlkZW86IHN1cHBvcnQgUm9ja3RlY2ggUkswNTBIUjM0NS1DVDEwNkEg
cGFuZWwKPgo+ICBhcmNoL3NhbmRib3gvaW5jbHVkZS9hc20vdGVzdC5oIHwgICA4ICsKPiAgZHJp
dmVycy9zcGkvc2FuZGJveF9zcGkuYyAgICAgICB8ICAyMSArKwo+ICBkcml2ZXJzL3NwaS9zcGkt
dWNsYXNzLmMgICAgICAgIHwgIDE5ICsrCj4gIGRyaXZlcnMvc3BpL3N0bTMyX3NwaS5jICAgICAg
ICAgfCAgNjcgKysrKystCj4gIGRyaXZlcnMvdmlkZW8vS2NvbmZpZyAgICAgICAgICAgfCAgIDgg
Kwo+ICBkcml2ZXJzL3ZpZGVvL01ha2VmaWxlICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy92
aWRlby9pbGl0ZWstaWxpOTgwNmUuYyB8IDM1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBpbmNsdWRlL3NwaS5oICAgICAgICAgICAgICAgICAgIHwgIDEyICsrCj4gIHRlc3Qv
ZG0vc3BpLmMgICAgICAgICAgICAgICAgICAgfCAgMTYgKysKPiAgOSBmaWxlcyBjaGFuZ2VkLCA0
OTkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvdmlkZW8vaWxpdGVrLWlsaTk4MDZlLmMKPgo+IC0tCj4gMi40My4wCj4KPiBiYXNlLWNv
bW1pdDogN2RjYTU0ZWY0YzQ0YzgyYmRjNjcxNmFjNmNkYzg0YzIyYzY2ZTllZAo+IGJyYW5jaDog
UkswNTBIUjM0NS1DVDEwNkEtT04tU1BJCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
