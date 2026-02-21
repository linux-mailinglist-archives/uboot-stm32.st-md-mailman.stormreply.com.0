Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D/kNY5/mWndUQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 Feb 2026 10:49:02 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03316C895
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 Feb 2026 10:49:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EAECC87ED8;
	Sat, 21 Feb 2026 09:41:30 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com
 [74.125.224.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DD4FC87ED6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Feb 2026 09:41:28 +0000 (UTC)
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-64aefa98fe6so2757886d50.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Feb 2026 01:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771666887; cv=none;
 d=google.com; s=arc-20240605;
 b=LUibpIZuH6CY3GDR6MVYmuu0KefySdwp7TSYgrWyYRQoThpkQkSI6mkZSL/lVtg7Dj
 RRTEjV+yTHlTpEOCU6XcwFsT9sjPUQVjiIHTsX1XdYpmdClYx0a8WJ+kFLpXn57LbqJg
 ejlZ2Qtpj6bwnXTvnGV43LnIDfXBEte30UaztlJz9M3kfgOsuIQyuNk5vKXhpK1IQrQT
 /kMmWgggTqA+zFPWlXsV/UxKR96PYjU3ab/MC3SWygCbRGKzM75ek14r2jlaxjN8sF4w
 cppm+QUjY+bElWD/us/lYcPTOiRNuNIPnpMiI91twzJNTMO7QcleMSxxw//L2rTM+Gfk
 HOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RT63xDCHTx5R/rxGKKixXYRUQOy1Xlae34V/UcOEGtg=;
 fh=CW+sn3oOAoRkv7lPpU3Q1Pqz2zWmpPYvrnC+rewTJes=;
 b=KHrMATNVQtaq1pqwArFyUOKfus9CS0g95h8UU7dZUAlEW3foxSZUJVE0X3WZVFDQlv
 1YdjBEe1Z0att1dnYTnehQHGHSr8uqYU/aG059dn/sUL4Rg88y0ulyIX7cKswmi4lZ4F
 r3b8phS1TG4sAnlR4ViL50GAMhsvLifdR0FLVsiYV35n4ba/vXtLKwqw+bMPpkOG8Gqm
 PwwOq9jR8DwMgZnssu4YGHrjHaVf7LfP2f0UgA6r9AGzHdS06VLAsRgeJaz7GJZe623H
 wM4g6neyG5koTROO72g+rU4Hkxeg46hsDVCCDjwemn+TDhLuLXwYdgPooW9+a8u/Igdv
 SX8A==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1771666887; x=1772271687;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RT63xDCHTx5R/rxGKKixXYRUQOy1Xlae34V/UcOEGtg=;
 b=Dg2GTaUlWzhUnWHD400ob7UMJnkGyZTwPdpRkMF3O6nnPC8RvogSApn6EUcwb6ypMg
 tyvgISCrONZiFxW3Mm1cDKeBjAXsOFDkbbMNRH086usPUmAZ9Nz3R+5cwKWhhQhFSOBp
 9nMdKMJPKODxUWyTJr5szht0G1dHUtb7P2G88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771666887; x=1772271687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RT63xDCHTx5R/rxGKKixXYRUQOy1Xlae34V/UcOEGtg=;
 b=rphSgIh2zNQwSLKqBaonTR/w/OBV2sVYw+1FDCINDpEyP1drb/Rg+rhB1xcueTo1t9
 llxhDkeQdevyDdGeKsCxpoR8TybtB+2YXKQISjZ15Z6qQTq9viUw3eXvecslw9Gk7bq6
 2D2AyK4Qz/U2+idoq9q7KGQw3Z2Oan1nzb9F93AdaAUFMU2JH/7rbYbR46Q3I6Q3e89M
 27QDGXNKIxE1YtIsya8ls3HZBJHBGDjrjLWexCg/0ONoRqN4Na7WNLiJN+bJtweQJX4I
 ISmgCmRduYkOH11cgK/5rFGEKClWPF45olTHb1G082iNqn5fnbPgb0W8xEM/y46wGY5d
 cZrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdaxXTWghdiaJ8etNjQSOg5JIJelDKNG4+yzS/Rr9apY/yoCg7BAqiAvhftSPSR3rhCFiecC9o6kBGkQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXDM3fzPFz9sozaJ5KXu1dfmhZ7vKFeqAsXPB/S81zA7RzAML3
 lPIgGh1gc8/CzV/3yqYawilpRncr1lg/hQ/mPNU5Y3bB+2odfAkdZ5qHyyuwPquXBQCs4oXNEnc
 pMFM2MyMhUpX0wpG8B429kefJdNTBvDWRmfxPy4pWhg==
X-Gm-Gg: AZuq6aISDBc/XM41fJX+LlkLQt2rXVSOgFdZTeFRue6RVOMFkWEAJWhRHK/7yZQkLZy
 DWAlvqq3ClA6tgpzHo/yFjVheT36Zb929nSoow41ZzmqXvN5SmkRNd6DJLqnhSoFQ4mdIXcTCjs
 OoAm2ZHx3ZfpIpVHi4HWES9ybCP3ssfuexPTwZ7iyn0pO3ZXJvGo10JobRWXAk4KbMZTlUPHoI/
 4UuSvlkepwgV7aM3YMa6y5T0KJnfDoiwmoDnLJuROG1IuJrP7d1BecKQHAO3NRI4Y1mV1SNIqXa
 O3nD/nWgRgKAMZQfm+HFFKkIA5SHz7a1XDo2Zg==
X-Received: by 2002:a05:690e:4198:b0:64a:f8b9:b892 with SMTP id
 956f58d0204a3-64c78e44502mr2065126d50.52.1771666886996; Sat, 21 Feb 2026
 01:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20260219175130.2839234-1-dario.binacchi@amarulasolutions.com>
 <CAPVz0n3E-v5EZ8THu76dXUeERrq1MCFyReib5rS9N3DV2Tkidg@mail.gmail.com>
In-Reply-To: <CAPVz0n3E-v5EZ8THu76dXUeERrq1MCFyReib5rS9N3DV2Tkidg@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 21 Feb 2026 10:41:16 +0100
X-Gm-Features: AaiRm52MmOD1K8dvlu8u_K2uhZfV1j2QJD_fK7SjX-fsFFPAhAmDqiNKiGEUBOg
Message-ID: <CABGWkvoBxaGUsXLvhFXNJ=xO-JSZ=Lravv10tXSdQ=oz=EtGRw@mail.gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:trini@konsulko.com,m:andrew.goodbody@linaro.org,m:ansuelsmth@gmail.com,m:xypron.glpk@gmx.de,m:sjg@chromium.org,m:simon.glass@canonical.com,m:ag.dev.uboot@gmail.com,m:dsimic@manjaro.org,m:u-boot@lists.denx.de,m:alpernebiyasak@gmail.com,m:agraf@csgraf.de,m:ion@agorria.com,m:miquel.raynal@bootlin.com,m:patrick.delaunay@foss.st.com,m:pbrobinson@gmail.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:linux-amarula@amarulasolutions.com,m:jagan@amarulasolutions.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,body];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[konsulko.com,linaro.org,gmail.com,gmx.de,chromium.org,canonical.com,manjaro.org,lists.denx.de,csgraf.de,agorria.com,bootlin.com,foss.st.com,st-md-mailman.stormreply.com,amarulasolutions.com];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.754];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,amarulasolutions.com:url,amarulasolutions.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 5A03316C895
X-Rspamd-Action: no action

SGVsbG8gU3Z5YXRvc2xhdiwKCk9uIFRodSwgRmViIDE5LCAyMDI2IGF0IDc6NDTigK9QTSBTdnlh
dG9zbGF2IFJ5aGVsIDxjbGFtb3I5NUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4g0YfRgiwgMTkg0LvR
jtGCLiAyMDI24oCv0YAuINC+IDE5OjUxIERhcmlvIEJpbmFjY2hpCj4gPGRhcmlvLmJpbmFjY2hp
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPiDQv9C40YjQtToKPiA+Cj4gPiBUaGlzIHNlcmllcyBhZGRz
IHN1cHBvcnQgZm9yIHRoZSBSb2NrdGVjaCBSSzA1MEhSMzQ1LUNUMTA2QSBwYW5lbC4KPiA+IFRo
ZSBpbml0aWFsaXphdGlvbiBvZiB0aGlzIHBhbmVsIHJlcXVpcmVzIGEgOS1iaXQgd29yZCBsZW5n
dGgKPiA+IGNvbmZpZ3VyYXRpb24uIFRvIHN1cHBvcnQgdGhpcywgSSBoYXZlIGV4dGVuZGVkIHRo
ZSBTVE0zMiBTUEkgZHJpdmVyCj4gPiAoaW5jbHVkaW5nIHN1cHBvcnQgZm9yIHRoZSBTVE0zMk1Q
MjUgU29DKSB0byBpbXBsZW1lbnQgdGhlIHNldF93b3JkbGVuCj4gPiBvcGVyYXRpb24uCj4gPgo+
ID4gVG8gcHJvcGVybHkgdmFsaWRhdGUgdGhlc2UgY2hhbmdlcyBhbmQgZW5zdXJlIHRoZSBTUEkg
dWNsYXNzIGNvcnJlY3RseQo+ID4gaGFuZGxlcyB0aGUgd29yZCBsZW5ndGggcHJvcGFnYXRpb24s
IEkgaGF2ZSBhbHNvIGltcGxlbWVudGVkIHRoZQo+ID4gY29ycmVzcG9uZGluZyBsb2dpYyBpbiB0
aGUgc2FuZGJveCBkcml2ZXIgYW5kIGFkZGVkIGEgZGVkaWNhdGVkIHVuaXQKPiA+IHRlc3QuCj4g
Pgo+ID4gSSBoYXZlIGdyb3VwZWQgdGhlc2UgcGF0Y2hlcyB0b2dldGhlciB0byBwcm92aWRlIGEg
Y29tcGxldGUgb3ZlcnZpZXcgb2YKPiA+IHRoZSBpbXBsZW1lbnRhdGlvbiBhbmQgaXRzIHZlcmlm
aWNhdGlvbi4KPiA+Cj4gPgo+ID4gRGFyaW8gQmluYWNjaGkgKDgpOgo+ID4gICBzcGk6IGFkZCBz
dXBwb3J0IGZvciBiaXRzLXBlci13b3JkIHNldHRpbmcKPiA+ICAgc3BpOiBzYW5kYm94X3NwaTog
c3VwcG9ydCB3b3JkbGVuIHNldHVwCj4gPiAgIHRlc3Q6IHNwaTogYWRkIHNhbmRib3hfc3BpX2dl
dF93b3JkbGVuIGludGVyZmFjZQo+ID4gICB0ZXN0OiBkbTogc3BpOiBhZGQgdGVzdGNhc2UgZm9y
IHNwaV9zZXRfd29yZGxlbigpCj4KPiBIZWxsbyBEYXJpbyEKPgo+IFlvdSBzaG91bGQgbm90IG5l
ZWQgdG8gbW9kaWZ5IHNwaSBmcmFtZXdvcmsgdG8gc3VwcG9ydCA5IGJpdCBsZW4geGZlci4KPiBk
bV9zcGlfeGZlciBzdXBwb3J0cyB0aGlzIGFscmVhZHksIHlvdSBuZWVkIG9ubHkgc3RtMzIgc3Vw
cG9ydCBmb3IKPiBub24tYWxpZ25lZCB4ZmVycy4KClRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNr
LgoKSSBpbml0aWFsbHkgZXhwbG9yZWQgdGhlIGFwcHJvYWNoIHlvdSBzdWdnZXN0ZWQuIEhvd2V2
ZXIsIGZvbGxvd2luZwp0aGUgU1RNMzIgZHJpdmVyCmltcGxlbWVudGF0aW9uIGluIHRoZSBMaW51
eCBrZXJuZWwsIEkgZm91bmQgdGhhdCBleHBsaWNpdGx5IG1hbmFnaW5nCnRoZSBiaXRzLXBlci13
b3JkCnBhcmFtZXRlciB3YXMgbmVjZXNzYXJ5LgoKSW4gdGhlIGN1cnJlbnQgU1RNMzJNUDIgZHJp
dmVyLCB0aGUgd29yZCBsZW5ndGggaXMgZWZmZWN0aXZlbHkKaGFyZGNvZGVkIHRvIDggYml0cy4g
VG8KYWRkcmVzcyB0aGlzLCBJIG5lZWRlZCB0byBpbXBsZW1lbnQgdGhlIHNldF93b3JkbGVuIG9w
cywgd2hpY2ggaXMKYWxyZWFkeSBkZWNsYXJlZAphbW9uZyB0aGUgYXZhaWxhYmxlIFNQSSBmcmFt
ZXdvcmsgb3BzIGJ1dCBoYWQgbm90IHlldCBiZWVuIGltcGxlbWVudGVkIG9yIHVzZWQuCgpUaGUg
cHJvb2Ygb2YgdGhpcyBhcHByb2FjaCBpcyB0aGF0IHRoZSBkcml2ZXIgbm93IGNvcnJlY3RseSBo
YW5kbGVzCm11bHRpLXdvcmQgMTYtYml0CnRyYW5zZmVycyBvZiBhbnkgYnVmZmVyIHNpemUsIHVz
aW5nIDktYml0IHdvcmRzIGFzIHJlcXVpcmVkLiBUaGlzIGlzIGEKc2lnbmlmaWNhbnQgaW1wcm92
ZW1lbnQKb3ZlciB0aGUgY29tbW9uIGltcGxlbWVudGF0aW9ucyB0aGF0IG9mdGVuIG9ubHkgc3Vw
cG9ydCBzaW5nbGUgMTYtYml0CmRhdGEgdHJhbnNmZXJzLgpJIGJlbGlldmUgdGhpcyBwcm92aWRl
cyB0aGUgbmVjZXNzYXJ5IGZsZXhpYmlsaXR5IHRoYXQgZG1fc3BpX3hmZXIKYWxvbmUgY291bGRu
J3QgYWNoaWV2ZQp3aXRob3V0IGEgd2F5IHRvIHJlZGVmaW5lIHRoZSB3b3JkIGJvdW5kYXJpZXMu
CgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCj4KPiBZb3UgY2FuIHJlZmVyIHRvIHNzZDI4MjUg
YnJpZGdlIGFzIGFuIGV4YW1wbGUgb2YgOS1iaXQgc3BpCj4gY29tbXVuaWNhdGlvbiBmb3Igd3Jp
dGUgYW5kIDE2IGJpdCByZWFkcy4KPgo+ID4gICBzcGk6IHN0bTMyOiBjbGVhbiB1cCBidWZmZXIg
bGVuZ3RoIGFzc2lnbm1lbnQKPiA+ICAgc3BpOiBzdG0zMjogYWRkIHN1cHBvcnQgZm9yIGJpdHMt
cGVyLXdvcmQgc2V0dGluZwo+ID4gICBzcGk6IHN0bTMyOiBleHRlbmQgc3VwcG9ydCB0byBTVE0z
Mk1QMjUKPiA+ICAgdmlkZW86IHN1cHBvcnQgUm9ja3RlY2ggUkswNTBIUjM0NS1DVDEwNkEgcGFu
ZWwKPiA+Cj4gPiAgYXJjaC9zYW5kYm94L2luY2x1ZGUvYXNtL3Rlc3QuaCB8ICAgOCArCj4gPiAg
ZHJpdmVycy9zcGkvc2FuZGJveF9zcGkuYyAgICAgICB8ICAyMSArKwo+ID4gIGRyaXZlcnMvc3Bp
L3NwaS11Y2xhc3MuYyAgICAgICAgfCAgMTkgKysKPiA+ICBkcml2ZXJzL3NwaS9zdG0zMl9zcGku
YyAgICAgICAgIHwgIDY3ICsrKysrLQo+ID4gIGRyaXZlcnMvdmlkZW8vS2NvbmZpZyAgICAgICAg
ICAgfCAgIDggKwo+ID4gIGRyaXZlcnMvdmlkZW8vTWFrZWZpbGUgICAgICAgICAgfCAgIDEgKwo+
ID4gIGRyaXZlcnMvdmlkZW8vaWxpdGVrLWlsaTk4MDZlLmMgfCAzNTQgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL3NwaS5oICAgICAgICAgICAgICAgICAgIHwg
IDEyICsrCj4gPiAgdGVzdC9kbS9zcGkuYyAgICAgICAgICAgICAgICAgICB8ICAxNiArKwo+ID4g
IDkgZmlsZXMgY2hhbmdlZCwgNDk5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vaWxpdGVrLWlsaTk4MDZlLmMKPiA+Cj4g
PiAtLQo+ID4gMi40My4wCj4gPgo+ID4gYmFzZS1jb21taXQ6IDdkY2E1NGVmNGM0NGM4MmJkYzY3
MTZhYzZjZGM4NGMyMmM2NmU5ZWQKPiA+IGJyYW5jaDogUkswNTBIUjM0NS1DVDEwNkEtT04tU1BJ
CgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIK
CmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUg
MzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0Bh
bWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
