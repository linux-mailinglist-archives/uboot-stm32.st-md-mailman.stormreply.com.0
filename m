Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xBsuJQVhRmrmSAsAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 02 Jul 2026 15:00:53 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1DE6F80C9
	for <lists+uboot-stm32@lfdr.de>; Thu, 02 Jul 2026 15:00:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=k6eN55UL;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA32C6C858;
	Thu,  2 Jul 2026 13:00:50 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com
 [74.125.224.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6261C6C856
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 13:00:48 +0000 (UTC)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-664d78637f8so2443190d50.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 06:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782997248; cv=none;
 d=google.com; s=arc-20260327;
 b=qt8d2FyetW/K5k1GNcB/TVUYhuV2+kfu7c8ty7qNrs8MubwPMjpUwDiGesXbQTgtZj
 rsb/iRwrSz/seHUQu1IWS8V8KGsYiMlvNw6jUkSY2xNuCYg6fSHMEmi/0W5FO/B9+Jlk
 67vlOir0VGlCDMjeW8kLW5pkprp+xOFQHK60D5gsKlAfiQwf0raIaalIg0gSOWK97j9y
 ctYtex/uk9s5Br7t7DnK7UwPnvZyBF/dN81zvOfJvcCCrHBZV9rpzz0nMQ/fLWoNBmzY
 cMVGZ/L7TleRA25SPuCP8EPuaDT1lpXnsnhmfMQbHGxlPMaY3L6EKgvC5DwujtVm6irt
 HGYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=C8xaCAhDL7OJuwlHuqRu2g86ZH3thOHsRN0taq/pk04=;
 fh=GgXxm5nU/yo3+2qwfMD2wHbVeJRbRalMzwtHEdxsJKs=;
 b=mCsbsS6tU/KbM5UT5qem0UCohsV0HkZ2ZBpgPYMEURHUZfsSc5LC1Hu7I0VyETVWe5
 5GsYscLtrGNJ7E801/99i76UCQo7xuES+MoTyWGtG11uqY0smFBO62YQpUUlkdHB36/n
 d5aZATUik314Ce84qqI+y8INGU8cstTUDKSs/Z/UZQmP9PA2Osc+L/CZPmqd5LJlWq+3
 v0M1/HnQqFNNkCob9aUXn0+W5MahvpiBwYMxtc4prHxRH5h8IZhYbpxApG0oVg0SSkqf
 wnO1MH3ooj0m7WFeXWzkqir6RR2D8PEvqxJ8pDvJyroZVxXDa53uviXvzbqDzzE7wBaE
 N3Gg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1782997248; x=1783602048;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8xaCAhDL7OJuwlHuqRu2g86ZH3thOHsRN0taq/pk04=;
 b=k6eN55ULqJ5gOuGkZuE3dSPoP6b7vVGJdo5DWcQqYG7NfUVzZupJ516kAjDpwjB1FZ
 0Ij09+/DL6l+lnZEVYIh8NMeiTgo8BHriAcJctbMWn0qT5XA20ZcftKhIfOVdH/bqsTT
 RHOhs8xVOwaTU2vKEQSyBV6DQQCCeQDQL/LJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782997248; x=1783602048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C8xaCAhDL7OJuwlHuqRu2g86ZH3thOHsRN0taq/pk04=;
 b=sB77fvJW5pQ4lTlkXjiT71SnNxwY6Gq2SzXyF9j+KOj9CJiRDBj1KQBQR8Y/LCtC82
 NegFw7G5gqOUl4RE+fUqz4WQ2/f7xdOIq4xJ0kM4heUPb1QZI2UtkcnRi6pp38PH7XtA
 TH6Nu7iiX4Xu9mu5fFaSFGDb6S0gnFXSy6yZiTU0TjdFCLDplaSDzZBt3YICOJ9uMhdI
 VXMbDmMF7ln4AHqibDJ08gRkUJlTSXVOpovUZdUbFNz6WHkmmU9WUWugMwaWjvE75Wnh
 skIdYBjO/Z1Jj0Z5rf0eAjsMvXoOUJVCISVD2y7odN6mFDQksbcBNIHiGOY2beSrRlcB
 6KDA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqashl2tLpm+oFIZAgbJEqomTDqSSsh8EIucT9XaIUjilsoA+nCdOq13a/TqKUwa2IiM/RMbXLhYo042Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxZvHyP6PG4V/ECS72RPsgY6VlwY7lFZm81spKHBsGU1NpyD1rJ
 CpAjRiz+MFU3/e/tAqIQoVM+B4fteHNAG1bT5XvV/b5BpGhmtimwlOAKUOOweCT4jJ8cm8T4L8F
 TovpFevARMuvTvIEnaEdtcsGcc8CU13JT/AG5jSlQag==
X-Gm-Gg: AfdE7clqqD3RDqDElEXG6zx/AwKq4SOi80NLyutfma4tHxPLRQreSVuqhESjRUUFck7
 T2x/5IE40R3sbtslDqH34A7hhBJarUXvDT6KFz2mit8PY+VboTp/t1LDUi32ulk2x1nTc/qkS0z
 ymuKaVcqP1fCT0N/VufyfK3aYpWMKQu0d9o4ve3FNBdl2metJkDu//DoNsLbKqqiIzC2irKc1xi
 RaVmYSZ64jZ8vNv+d2tsioUrQ8Iuhe/vktLN3hlQsX33CLbRHgxIxtA9HAmjE2osx51bBv7inC6
 sr45DPCMY3BOHmm1vM2y4mX7c9UbPWerzOfk
X-Received: by 2002:a05:690e:484b:b0:664:b4b6:b09c with SMTP id
 956f58d0204a3-66521a2987dmr4247564d50.6.1782997247466; Thu, 02 Jul 2026
 06:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260529153159.3944049-1-dario.binacchi@amarulasolutions.com>
 <8aab07b8-9a23-4c0d-a2f9-3943f6490a60@foss.st.com>
In-Reply-To: <8aab07b8-9a23-4c0d-a2f9-3943f6490a60@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 2 Jul 2026 15:00:36 +0200
X-Gm-Features: AVVi8Cd1TORiw-1IRZ7FaxiJrZvkRi6T2wgDRC04ImYM4sEn8PS_fnARYqwuiG0
Message-ID: <CABGWkvoUa0AHPFmqD-AKfik8oMdBh=JD-1JUcb3cMFDovmdwmg@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2] ARM: dts: stm32: add U-Boot specific
	dtsi for stm32mp157f-dk2
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.69 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:trini@konsulko.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:url,mail.gmail.com:mid,amarulasolutions.com:email,amarulasolutions.com:url,amarulasolutions.com:from_mime,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E1DE6F80C9

SGkgUGF0cmljZQoKT24gTW9uLCBKdW4gMjksIDIwMjYgYXQgOToyOeKAr0FNIFBhdHJpY2UgQ0hP
VEFSRAo8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiA1LzI5
LzI2IDE3OjMxLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+IFRoZSBTVE0zMk1QMTU3Ri1ESzIg
Ym9hcmQgaXMgYSBkaXJlY3QgZGVyaXZhdGl2ZSBvZiB0aGUgU1RNMzJNUDE1N0MtREsyLgo+ID4g
QXMgZXhwbGFpbmVkIGJ5IFNUIFsxXSwgdGhlICJTVE0zMk1QMTU3Ri1ESzIgaXMgYXNzZW1ibGVk
IHdpdGggbGF0ZXN0Cj4gPiBTVE0zMk1QMTUgUmV2WiBjdXQgd2hpY2ggaXMgdGhlIG9ubHkgb25l
IGF2YWlsYWJsZSBmb3IgbmV3IHByb2R1Y3Qgbm93Lgo+ID4gVGhlIG1ham9yIGRpZmZlcmVuY2Vz
IGluIHRoaXMgJ0YnIHZhcmlhbnQgU29DIGFyZSB0aGUgaW5jcmVhc2VkIG1heAo+ID4gZnJlcXVl
bmN5IG9mIHRoZSBDb3J0ZXgtQTcgY29yZXMgYW5kIHRoZSBjb3JyZWN0aW9uIG9mIHNvbWUgSFcg
YnVncwo+ID4gKERldmljZSBSZXYuWiwgc2VlIGVycmF0YSBFUzA0MzgpIi4KPiA+Cj4gPiBPbiB0
aGUgc29mdHdhcmUvYXJjaGl0ZWN0dXJlIHNpZGUsIHRoaXMgdmFyaWFudCB1dGlsaXplcyBTQ01J
IChTeXN0ZW0KPiA+IENvbnRyb2wgYW5kIE1hbmFnZW1lbnQgSW50ZXJmYWNlKSBmb3Igc2VjdXJl
IHdvcmxkIHJlc291cmNlIG1hbmFnZW1lbnQuCj4gPiBBcyBhIGNvbnNlcXVlbmNlLCB0aGUgdW5k
ZXJseWluZyBzdG0zMm1wMTUtc2NtaS5kdHNpIGV4cGxpY2l0bHkgZGVsZXRlcwo+ID4gc2V2ZXJh
bCBmaXhlZCBjbG9jayBub2RlcyAoc3VjaCBhcyBjbGtfaHNlLCBjbGtfaHNpLCBjbGtfbHNlLCBj
bGtfbHNpLAo+ID4gYW5kIGNsa19jc2kpLCBtYWtpbmcgaXQgaW1wb3NzaWJsZSB0byBpbmNsdWRl
IHN0bTMybXAxNTdjLWRrMi11LWJvb3QuZHRzaQo+ID4gd2l0aG91dCB0cmlnZ2VyaW5nIGNvbXBp
bGF0aW9uIGVycm9ycyBkdWUgdG8gdGhlc2UgbWlzc2luZyBjbG9jayBsYWJlbHMuCj4gPgo+ID4g
U28gbGV0J3MgaW50cm9kdWNlIGEgZGVkaWNhdGVkIHN0bTMybXAxNTdmLWRrMi11LWJvb3QuZHRz
aSB0aGF0IGRpcmVjdGx5Cj4gPiBkZWZpbmVzIHRoZSBmd3UtbWRhdGEgbm9kZS4gVGhpcyBwcm92
aWRlcyB0aGUgbmVjZXNzYXJ5IEZXVSBtZXRhZGF0YQo+ID4gY29uZmlndXJhdGlvbiByZXF1aXJl
ZCB0byBhbGxvdyBhdXRvbWF0aWMgQS9CIGJhbmsgc2VsZWN0aW9uLCBzdXBwb3J0ZWQKPiA+IGZv
ciBTVE0zMk1QMTUgYm9hcmRzIGJ5IGNvbW1pdCA1NjBkOGYzMjcwM2YgKCJib2FyZDogc3Q6IHN0
bTMybXAxNToKPiA+IHN1cHBvcnQgZHluYW1pYyBBL0IgYmFuayBib290dXAiKS4KPiA+Cj4gPiBb
MV0gaHR0cHM6Ly9jb21tdW5pdHkuc3QuY29tL3Q1L3N0bTMyLW1wdXMtcHJvZHVjdHMtYW5kLWhh
cmR3YXJlL2ktbS13b25kZXJpbmctd2hhdC1zLXRoZS1kaWZmZXJlbmNlLXBvaW50LWJldHdlZW4t
c3RtMzJtcDE1N2MvdGQtcC8yMTM0NjAKPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hp
IDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+Cj4gPiAtLS0KPiA+Cj4g
PiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBEcm9wIHRoZSBpbmNsdXNpb24gb2Ygc3RtMzJtcDE1N2Mt
ZGsyLXUtYm9vdC5kdHNpIHRvIGF2b2lkIGNvbXBpbGF0aW9uCj4gPiAgIGVycm9ycyBjYXVzZWQg
YnkgZGVsZXRlZCBjbG9jayBub2RlcyBpbiBzdG0zMm1wMTUtc2NtaS5kdHNpLgo+ID4gLSBEaXJl
Y3RseSBkZWZpbmUgdGhlIGZ3dS1tZGF0YSBub2RlIGluIHN0bTMybXAxNTdmLWRrMi11LWJvb3Qu
ZHRzaSB0bwo+ID4gICBwcm9wZXJseSBzdXBwb3J0IGF1dG9tYXRpYyBBL0IgYmFuayBzZWxlY3Rp
b24uCj4gPgo+ID4gIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Zi1kazItdS1ib290LmR0c2kgfCAx
MSArKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Zi1kazItdS1ib290LmR0
c2kKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdmLWRrMi11LWJv
b3QuZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Zi1kazItdS1ib290LmR0c2kKPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjc3ODA1NDE3YmZhOQo+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdmLWRrMi11
LWJvb3QuZHRzaQo+ID4gQEAgLTAsMCArMSwxMSBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wKwo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDI2IEFtYXJ1
bGEgU29sdXRpb25zLCBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0
aW9ucy5jb20+Cj4gPiArICovCj4gPiArCj4gPiArLyB7Cj4gPiArICAgICBmd3UtbWRhdGEgewo+
ID4gKyAgICAgICAgICAgICBjb21wYXRpYmxlID0gInUtYm9vdCxmd3UtbWRhdGEtZ3B0IjsKPiA+
ICsgICAgICAgICAgICAgZnd1LW1kYXRhLXN0b3JlID0gPCZzZG1tYzE+Owo+ID4gKyAgICAgfTsK
PiA+ICt9Owo+Cj4gSGkgRGFyaW8KPgo+IFdoYXQgYWJvdXQgaW5jbHVkaW5nIHN0bTMybXAxNTdj
LWRrMi11LWJvb3QuZHRzaSBpbnN0ZWFkIG9mIGRlZmluaW5nIGZ3dS1tZGF0YSBub2RlID8KClRo
aXMgd2FzIGFjdHVhbGx5IHRoZSBhcHByb2FjaCB1c2VkIGluIHYxLiBIb3dldmVyLCBhcyB5b3Ug
cG9pbnRlZCBvdXQgaW4gdGhlCnYxIHRocmVhZCBbMV0sIGl0IGRvZXMgbm90IGJ1aWxkIGJlY2F1
c2Ugc3RtMzJtcDE1LXNjbWkuZHRzaSByZW1vdmVzIHRoZQpjbGtfaHNlLCBjbGtfaHNpLCBjbGtf
bHNlLCBjbGtfbHNpIGFuZCBjbGtfY3NpIGxhYmVscyByZWZlcmVuY2VkIGJ5CnN0bTMybXAxNTdj
LWRrMi11LWJvb3QuZHRzaS4KClRoYXQncyB3aHkgSSBkcm9wcGVkIHRoZSBpbmNsdWRlIGluIHYy
IGFuZCBkZWZpbmVkIG9ubHkgdGhlIGZ3dS1tZGF0YSBub2RlCmxvY2FsbHkuCgpPciBhbSBJIHBl
cmhhcHMgbWlzc2luZyBzb21ldGhpbmc/CgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjYwNTEyMDcxMTU3LjU2NDA4MS0xLWRhcmlvLmJpbmFj
Y2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tLwoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPgo+
IFRoYW5rcwo+IFBhdHJpY2UKCgoKLS0gCkRhcmlvIEJpbmFjY2hpClNlbmlvciBFbWJlZGRlZCBT
b2Z0d2FyZSBFbmdpbmVlcgpNLiArMzkgMzI4IDA2MjUyNDYKZGFyaW8uYmluYWNjaGlAYW1hcnVs
YXNvbHV0aW9ucy5jb20K4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCVCkFtYXJ1bGEgU29sdXRpb25zIFNSTAogVmlhIEZlbGljZSBDYXZhbGxvdHRpIDI1RCwgNDEw
MTIgQ2FycGksIE1PLCBJVAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5hbWFydWxhc29s
dXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
