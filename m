Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEViCE+oDWpr1AUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 14:25:51 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C258D989
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 14:25:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2CFFC87ED1;
	Wed, 20 May 2026 12:25:49 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79659C01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 12:25:48 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gL9k22WTwz9v73;
 Wed, 20 May 2026 14:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1779279946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwgR0cWoSJQJk3CT3CLhPHSy8I9xsP3OJTaEqDziwDo=;
 b=EyGfSl0DaDaSgDFS71mlkB9m6uSapGjQjB7IEGVRXIcfLvcGvnvPwhXsCqUhg6k/1RgmMP
 9R7rwE3ILxHKTNvAihNEg9TeARaTU1UU1jjI/S9jQzoL0j/j58g+KAfvPl/D9sz8lNCkZd
 q/23kbVlCDoEjchk9/oR8jTIWoRyyZ1vOqdufBQm6R5LBUzKSkPhNStdQDctZQRQL8zU+/
 +rq0W2RljotehdJMlLP2I95jzje1oxxbtU3kD+cnb3YEZBaHEfm1tcrBpMN4WITdVtkfiH
 pDZyVQYayGXWi0IcTKMqJK76NFwxFrUwRdZe+GOBx7gWuEG3nJGUiXl5auajOQ==
Message-ID: <0d3b1038-f90e-44e5-9b1e-bf9035f32784@mailbox.org>
Date: Wed, 20 May 2026 14:25:17 +0200
MIME-Version: 1.0
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Yann Gautier <yann.gautier@foss.st.com>, u-boot@lists.denx.de
References: <20260519163145.221668-1-yann.gautier@foss.st.com>
 <20260519163145.221668-3-yann.gautier@foss.st.com>
 <f420eff8-6524-4797-93b7-0f9a1149e860@mailbox.org>
 <1aec25d4-3135-433d-8fcd-4ead7a065d40@foss.st.com>
 <9b59c08a-ea36-44b3-9c30-d1bd555f661e@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <9b59c08a-ea36-44b3-9c30-d1bd555f661e@foss.st.com>
X-MBO-RS-META: kbkstnfykssu531rxu19wucd7ddosohe
X-MBO-RS-ID: cd028aaf74393daf796
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] configs: stm32mp13: activate
	watchdog
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
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[mailbox.org : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[mailbox.org:s=mail20150812];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:trini@konsulko.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mailbox.org:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: A87C258D989
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNS8yMC8yNiAxMTowNCBBTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biA1LzIwLzI2IDA5OjA1LCBZYW5uIEdhdXRpZXIgd3JvdGU6Cj4+IE9uIDUvMTkvMjYgMTg6NTgs
IE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gT24gNS8xOS8yNiA2OjMxIFBNLCBZYW5uIEdhdXRpZXIg
d3JvdGU6Cj4+Pj4gTm8gd2F0Y2hkb2cgd2FzIGVuYWJsZWQgZm9yIFNUTTMyTVAxMyBwbGF0Zm9y
bS4gQWRkIHRoZSByZXF1aXJlZCAKPj4+PiBmbGFncyB0bwo+Pj4+IHN1cHBvcnQgaXQuIEFzIGRv
bmUgZm9yIFNUTTMyTVAxNSAoaW4gU0NNSSBjb25maWcpIGFuZCBTVE0zMk1QMngsIHdlIAo+Pj4+
IHVzZQo+Pj4+IHRoZSBBcm0gU01DIHdhdGNoZG9nLiBUaGUgcmVxdWlyZWQgbm9kZXMgd2VyZSBh
bHJlYWR5IHByZXNlbnQgaW4gTGludXgKPj4+PiBpbXBvcnRlZCBEVCBmaWxlcyAoc3RtMzJtcDEz
LmR0c2kgJiBzdG0zMm1wMTM1Zi1kay5kdHMpLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUGF0
cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBZYW5uIEdhdXRpZXIgPHlhbm4uZ2F1dGllckBmb3NzLnN0LmNvbT4KPj4+Pgo+Pj4+
IC0tLQo+Pj4+Cj4+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+PiAtIHVwZGF0ZSBjb21taXQgbWVzc2Fn
ZQo+Pj4+Cj4+Pj4gwqAgY29uZmlncy9zdG0zMm1wMTNfZGVmY29uZmlnIHwgMyArKysKPj4+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEv
Y29uZmlncy9zdG0zMm1wMTNfZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMm1wMTNfZGVmY29uZmln
Cj4+Pj4gaW5kZXggNjIwYTZkYTJlZmUzLi5jYzQxNTg1MDk3YzcgMTAwNjQ0Cj4+Pj4gLS0tIGEv
Y29uZmlncy9zdG0zMm1wMTNfZGVmY29uZmlnCj4+Pj4gKysrIGIvY29uZmlncy9zdG0zMm1wMTNf
ZGVmY29uZmlnCj4+Pj4gQEAgLTExMyw0ICsxMTMsNyBAQCBDT05GSUdfVVNCX0dBREdFVF9NQU5V
RkFDVFVSRVI9IlNUTWljcm9lbGVjdHJvbmljcyIKPj4+PiDCoCBDT05GSUdfVVNCX0dBREdFVF9W
RU5ET1JfTlVNPTB4MDQ4Mwo+Pj4+IMKgIENPTkZJR19VU0JfR0FER0VUX1BST0RVQ1RfTlVNPTB4
NTcyMAo+Pj4+IMKgIENPTkZJR19VU0JfR0FER0VUX0RXQzJfT1RHPXkKPj4+PiArQ09ORklHX1dE
VD15Cj4+Pj4gK0NPTkZJR19XRFRfU1RNMzJNUD15Cj4+PiBXaHkgaXMgQ09ORklHX1dEVF9TVE0z
Mk1QIGVuYWJsZWQgaGVyZSAsIGlzIHRoaXMgdGhlIEFSTSBTTUMgd2F0Y2hkb2cgCj4+PiBkcml2
ZXIgPwo+PiBUaGlzIGlzIGFsaWduZWQgd2l0aCBzdG0zMm1wMTUgY29uZmlnLCBhbmQgbm8sIHRo
aXMgb25lIGlzIHRoZSBTVE0zMiAKPj4gSVdERyBkcml2ZXIuCj4+IEknbGwgY2hlY2sgdGhhdCB3
aXRoIFBhdHJpY2sgKHdobyBvcmlnaW5hbGx5IHdyb3RlIHRoZSBwYXRjaCksIGFzIGl0IAo+PiBz
ZWVtcyB0aGF0IHRoaXMgZmxhZyBjb3VsZCBiZSByZW1vdmVkLgo+Pgo+IAo+IEkgYWdyZWUgd2l0
aCBNYXJlay4KPiAKPiBUb2RheSBDT05GSUdfV0RUX1NUTTMyTVAgaXMgbm90IHJlYWxseSBuZWVk
ZWQgYXMgb25seSBhcm1fd2R0IGlzIAo+IGFjdGl2YXRlZCBpbiBTVE0zMk1QMTMgZGV2aWNlIHRy
ZWUgZm9yIFNUIGJvYXJkcwoKTWFrZSBzdXJlIHlvdSBkb3VibGUtY2hlY2sgdGhlIHN0bTMybXAx
M3h4IGRoY29yIHRvby4KCklmIHRoZSBXRFQgaXMgc3VwcG9zZWQgdG8gYmUgYWN0aXZhdGVkIGhl
cmUsIGl0IGhhcyB0byBiZSBkb2N1bWVudGVkIGluIApjb21taXQgbWVzc2FnZSB0b28gLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
