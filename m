Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI3nJSR932lAUAAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2026 13:57:24 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA6404152
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2026 13:57:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E769C90081;
	Wed, 15 Apr 2026 11:51:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E333EC8F286
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 09:17:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5AF931A329C;
 Tue, 14 Apr 2026 09:17:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3074B5FFBB;
 Tue, 14 Apr 2026 09:17:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5DED410450093; 
 Tue, 14 Apr 2026 11:17:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776158264; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Lms9VHwybC4O364iAvPNW7+860fAl7hg+UtIui2DdoY=;
 b=vl1d0Xq9LE7nUZ3FzD1gr+NG4qi4LnfDO+lwqnvP7HYAvCrvuNzkju2dQDbSK04ib7DnfI
 qzc4eHrRvvgYmuvOidf3G5DWr5nMxGCLlOOlra/NcknQ8isnMtYLiiLdrnVXc/gtp57No1
 pGn7UtthqPSiZX5FYdNRYoA5Lul6G+4+F+072qdIn3WoJ1ZdNST1IXX0acrO5sg3gH9tSh
 dRnZAvAX8Dcc5f6ZGV7i5hb4NUIlXgHxeeE/U5B8vo4GiBCZlENWVktk9uPhiFJ/lT7XsW
 opQWuxufKWtRxjnjOTq7KI9mltEmhyuueYxj/03z2C4Ly09s6I2BhghSqLOqzw==
Date: Tue, 14 Apr 2026 11:17:41 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20260414111741.511707e5@kmaincent-XPS-13-7390>
In-Reply-To: <20260414-fix_usb_adc_meausurement-v1-1-8cdbd4c10dd8@foss.st.com>
References: <20260414-fix_usb_adc_meausurement-v1-1-8cdbd4c10dd8@foss.st.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 15 Apr 2026 11:51:29 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Tom Rini <trini@konsulko.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [6.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	DATE_IN_PAST(1.00)[26];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:marek.vasut+renesas@mailbox.org,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email]
X-Rspamd-Queue-Id: 17AA6404152
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gVHVlLCAxNCBBcHIgMjAyNiAxMTowNjo1MCArMDIwMApQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IERlcGVuZGluZyBvZiBwbHVnZ2VkIHBv
d2VyIHNvdXJjZSAoY29tcHV0ZXIsIHdhbGwgY2hhcmdlciwgLi4uKSBpdCBjYW4KPiBoYXBwZW4g
dGhhdCB3ZSBnb3QgdGhlIGZvbGxvd2luZyBtZXNzYWdlOgo+IAo+ICIqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqIgo+ICIqICAgICAgVVNCIFRZUEUt
QyBjaGFyZ2VyIG5vdCBjb21wbGlhbnQgd2l0aCAgICAgICAqIgo+ICIqICAgICAgICAgICAgICAg
ICAgIHNwZWNpZmljYXRpb24gICAgICAgICAgICAgICAgICAqIgo+ICIqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqIgo+ICIgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIgo+ICIjIyMgRVJST1IgIyMjIFBs
ZWFzZSBSRVNFVCB0aGUgYm9hcmQgIyMjICAgICAgICAgICAgIgo+IAo+IFRoaXMgaXNzdWUgaGFz
IGJlZW4gZGV0ZWN0ZWQgb24gU1RNMzJNUDEzNWYtREsgYm9hcmQuCj4gCj4gSXQncyBkdWUgdG8g
bWF4X3VWIGFuZCBtaW5fdVYgdmFsdWUgYXJlIGluaXRpYWxpemVkIGF0IGJlZ2lubmluZyBvZgo+
IGJvYXJkX2NoZWNrX3VzYl9wb3dlcigpIGFuZCBjYW4gdGhlbiBiZSB1c2VkIGZvciB0aGUgMiBp
dGVyYXRpb24gb2YKPiBhZGNfbWVhc3VyZW1lbnQoKS4KPiBtYXhfdVYvbWluX3VWIHZhbHVlcyBp
c3N1ZWQgb2YgdGhlIGZpcnN0IGFkY19tZWFzdXJlbWVudCgpIGl0ZXJhdGlvbgo+IGFyZSB1c2Vk
IGFzIGlucHV0IG9mIHRoZSBzZWNvbmQgYWRjX21lYXN1cmVtZW50KCkgaXRlcmF0aW9uLCB3aGlj
aAo+IGNhbiBsZWFkIHRvIGluY29oZXJlbnQgcGFpciBvZiBtaW5fdVYvbWF4X3VWIHZhbHVlcy4K
PiAKPiBUbyBlbnN1cmUgdGhhdCBhZGNfbWVhc3VyZW1lbnQoKSByZXR1cm5zIGNvaGVyZW50IHZh
bHVlIGZvciBtYXhfdVYgYW5kCj4gbWluX3VWLCBpbml0aWFsaXplIG1heF91ViBhbmQgbWluX3VW
IGF0IGVhY2ggbG9vcCBzdGFydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQg
PHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KClJldmlld2VkLWJ5OiBLb3J5IE1haW5jZW50
IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPgoKVGhhbmsgeW91IQotLSAKS8O2cnkgTWFpbmNl
bnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
