Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71199A194DD
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2025 16:17:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34FA5C78F7C;
	Wed, 22 Jan 2025 15:17:20 +0000 (UTC)
Received: from mout-u-204.mailbox.org (mout-u-204.mailbox.org [80.241.59.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 473BAC78F77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 15:17:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4YdSNr5q6Dz9smk;
 Wed, 22 Jan 2025 16:17:16 +0100 (CET)
Message-ID: <cf0bbbe1-7a0c-4af0-8334-e4126c6c71a8@denx.de>
Date: Wed, 22 Jan 2025 16:17:15 +0100
MIME-Version: 1.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250114132814.1250117-1-patrice.chotard@foss.st.com>
 <20250114132814.1250117-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20250114132814.1250117-2-patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, Devarsh Thakkar <devarsht@ti.com>,
 Rasmus Villemoes <ravi@prevas.dk>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] cyclic: Fix typo in struct
	cyclic_info description
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

T24gMTQuMDEuMjUgMTQ6MjgsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPiBSZXBsYWNlIGRlbGF5
X25zIGJ5IGRlbGF5X3VzIHdoaWNoIGlzIHRoZSBmaWVsZCBuYW1lIHVzZWQgaW50bwo+IHN0cnVj
dCBjeWNsaWNfaW5mby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiAKPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHYyOgo+ICAg
IF8gVXBkYXRlIHRoZSBjb21tZW50IHdoaWNoIHN0aWxsIHJlZmVyZW5jZXMgIm5zIgoKQXBwbGll
ZCB0byB1LWJvb3Qtd2F0Y2hkb2cvbWFzdGVyCgpUaGFua3MsClN0ZWZhbgoKPiAKPiAgIGluY2x1
ZGUvY3ljbGljLmggfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9jeWNsaWMuaCBiL2luY2x1ZGUv
Y3ljbGljLmgKPiBpbmRleCBjNmM0NjNkNjhlOS4uZGY4YjcyNWUzZDAgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9jeWNsaWMuaAo+ICsrKyBiL2luY2x1ZGUvY3ljbGljLmgKPiBAQCAtMjAsNyArMjAs
NyBAQAo+ICAgICoKPiAgICAqIEBmdW5jOiBGdW5jdGlvbiB0byBjYWxsIHBlcmlvZGljYWxseQo+
ICAgICogQG5hbWU6IE5hbWUgb2YgdGhlIGN5Y2xpYyBmdW5jdGlvbiwgZS5nLiBzaG93biBpbiB0
aGUgY29tbWFuZHMKPiAtICogQGRlbGF5X25zOiBEZWxheSBpcyBucyBhZnRlciB3aGljaCB0aGlz
IGZ1bmN0aW9uIHNoYWxsIGdldCBleGVjdXRlZAo+ICsgKiBAZGVsYXlfdXM6IERlbGF5IGlzIHVz
IGFmdGVyIHdoaWNoIHRoaXMgZnVuY3Rpb24gc2hhbGwgZ2V0IGV4ZWN1dGVkCj4gICAgKiBAc3Rh
cnRfdGltZV91czogU3RhcnQgdGltZSBpbiB1cywgd2hlbiB0aGlzIGZ1bmN0aW9uIHN0YXJ0ZWQg
aXRzIGV4ZWN1dGlvbgo+ICAgICogQGNwdV90aW1lX3VzOiBUb3RhbCBDUFUgdGltZSBvZiB0aGlz
IGZ1bmN0aW9uCj4gICAgKiBAcnVuX2NudDogQ291bnRlciBvZiBleGVjdXRpb25zIG9jY3VyYW5j
ZXMKClZpZWxlIEdyw7zDn2UsClN0ZWZhbiBSb2VzZQoKLS0gCkRFTlggU29mdHdhcmUgRW5naW5l
ZXJpbmcgR21iSCwgICAgICBNYW5hZ2luZyBEaXJlY3RvcjogRXJpa2EgVW50ZXIKSFJCIDE2NTIz
NSBNdW5pY2gsIE9mZmljZTogS2lyY2hlbnN0ci41LCBELTgyMTk0IEdyb2ViZW56ZWxsLCBHZXJt
YW55ClBob25lOiAoKzQ5KS04MTQyLTY2OTg5LTUxIEZheDogKCs0OSktODE0Mi02Njk4OS04MCBF
bWFpbDogc3JAZGVueC5kZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
