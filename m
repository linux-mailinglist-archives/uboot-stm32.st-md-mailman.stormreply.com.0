Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACFA16948
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jan 2025 10:23:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3637CC78002;
	Mon, 20 Jan 2025 09:23:13 +0000 (UTC)
Received: from mout-u-204.mailbox.org (mout-u-204.mailbox.org [80.241.59.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D66A6CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 09:23:12 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4Yc4dB44cjz9t1F;
 Mon, 20 Jan 2025 10:23:10 +0100 (CET)
Message-ID: <4b8ff4a2-2ed1-4a72-9852-34d0f4b4eb36@denx.de>
Date: Mon, 20 Jan 2025 10:23:09 +0100
MIME-Version: 1.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250114132814.1250117-1-patrice.chotard@foss.st.com>
 <20250114132814.1250117-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20250114132814.1250117-2-patrice.chotard@foss.st.com>
X-Rspamd-Queue-Id: 4Yc4dB44cjz9t1F
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
IF8gVXBkYXRlIHRoZSBjb21tZW50IHdoaWNoIHN0aWxsIHJlZmVyZW5jZXMgIm5zIgoKUmV2aWV3
ZWQtYnk6IFN0ZWZhbiBSb2VzZSA8c3JAZGVueC5kZT4KClRoYW5rcywKU3RlZmFuCgo+IAo+ICAg
aW5jbHVkZS9jeWNsaWMuaCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2N5Y2xpYy5oIGIvaW5j
bHVkZS9jeWNsaWMuaAo+IGluZGV4IGM2YzQ2M2Q2OGU5Li5kZjhiNzI1ZTNkMCAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2N5Y2xpYy5oCj4gKysrIGIvaW5jbHVkZS9jeWNsaWMuaAo+IEBAIC0yMCw3
ICsyMCw3IEBACj4gICAgKgo+ICAgICogQGZ1bmM6IEZ1bmN0aW9uIHRvIGNhbGwgcGVyaW9kaWNh
bGx5Cj4gICAgKiBAbmFtZTogTmFtZSBvZiB0aGUgY3ljbGljIGZ1bmN0aW9uLCBlLmcuIHNob3du
IGluIHRoZSBjb21tYW5kcwo+IC0gKiBAZGVsYXlfbnM6IERlbGF5IGlzIG5zIGFmdGVyIHdoaWNo
IHRoaXMgZnVuY3Rpb24gc2hhbGwgZ2V0IGV4ZWN1dGVkCj4gKyAqIEBkZWxheV91czogRGVsYXkg
aXMgdXMgYWZ0ZXIgd2hpY2ggdGhpcyBmdW5jdGlvbiBzaGFsbCBnZXQgZXhlY3V0ZWQKPiAgICAq
IEBzdGFydF90aW1lX3VzOiBTdGFydCB0aW1lIGluIHVzLCB3aGVuIHRoaXMgZnVuY3Rpb24gc3Rh
cnRlZCBpdHMgZXhlY3V0aW9uCj4gICAgKiBAY3B1X3RpbWVfdXM6IFRvdGFsIENQVSB0aW1lIG9m
IHRoaXMgZnVuY3Rpb24KPiAgICAqIEBydW5fY250OiBDb3VudGVyIG9mIGV4ZWN1dGlvbnMgb2Nj
dXJhbmNlcwoKVmllbGUgR3LDvMOfZSwKU3RlZmFuIFJvZXNlCgotLSAKREVOWCBTb2Z0d2FyZSBF
bmdpbmVlcmluZyBHbWJILCAgICAgIE1hbmFnaW5nIERpcmVjdG9yOiBFcmlrYSBVbnRlcgpIUkIg
MTY1MjM1IE11bmljaCwgT2ZmaWNlOiBLaXJjaGVuc3RyLjUsIEQtODIxOTQgR3JvZWJlbnplbGws
IEdlcm1hbnkKUGhvbmU6ICgrNDkpLTgxNDItNjY5ODktNTEgRmF4OiAoKzQ5KS04MTQyLTY2OTg5
LTgwIEVtYWlsOiBzckBkZW54LmRlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
