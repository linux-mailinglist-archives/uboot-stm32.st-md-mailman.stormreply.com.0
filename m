Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C681B9ACA65
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2024 14:45:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 843A2C71289;
	Wed, 23 Oct 2024 12:45:17 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1EC3C71287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 12:45:09 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XYTKH0y9Gz9tSh;
 Wed, 23 Oct 2024 14:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729687507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jR6hH7qQagObgfMRWn+Z30a2P5s5WAjKp9PuinFV2b8=;
 b=X3yPWnKibj+EKNgKF2+Iisy8q6T1hu3aTiGpLbcOLlk410G9XkNQxa/8SLaG6ZLqq0Xtzh
 l+CX2kH1ETJbBANzLE0WlpdcypA/HBK+wR9Y6OP7gPlCV7njd9TVLRF4PgA2YuY7/nZtnW
 0x97QTLsFTJwetmzNurYRPsq/VDGSdcBb/u5VtZk5OHlvJexb3UTG7OJYdAU/3gXWbey+m
 OVD6I8971xY4p7PnjVEukPuGTBlggqfACvGl/gyhwuUeFGjwAYXXOBx2wlxsJBhy0cKGKu
 X22nPT0ETaI1vg6ErBjqPnx39NiacggkDXGJsgi2L7Y/HHIEH3y9zVszCLWx9A==
Message-ID: <03389ee7-3da9-4160-a193-00fd517ad56e@mailbox.org>
Date: Wed, 23 Oct 2024 14:45:02 +0200
MIME-Version: 1.0
To: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
 <SA1PR12MB869767A8D003AB114830D46A984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <SA1PR12MB869767A8D003AB114830D46A984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
X-MBO-RS-META: xajrgtgggyad68mcu13i416xeo4xuswr
X-MBO-RS-ID: 62ef564259d206bf4ea
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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

T24gMTAvMjMvMjQgMTE6MDcgQU0sIEFiYmFyYXB1LCBWZW5rYXRlc2ggd3JvdGU6Cj4gSGksCj4g
VGVzdGVkIHdpdGggdGhlIG5vbi1zdGFja2VkIGRlZmF1bHQgc2luZ2xlIGNvbmZpZ3VyYXRpb24g
b24gWnlucU1QIHpjdTEwMiBib2FyZCBhbmQgZGlkbuKAmXQgc2VlIGFueSBpc3N1ZS4KPiAKPiBa
eW5xTVA+IHNmIHByb2JlIDAgMCAwCj4gU0Y6IERldGVjdGVkIG10MjVxdTUxMmEgd2l0aCBwYWdl
IHNpemUgMjU2IEJ5dGVzLCBlcmFzZSBzaXplIDY0IEtpQiwgdG90YWwgNjQgTWlCCj4gWnlucU1Q
PiBzZiBlcmFzZSAweDAgMHg0MDAwMDAwO213LmIgMHg4MDAwIGFhYmJjY2RkIDB4NDAwMDAwMDtz
ZiB3cml0ZSAweDgwMDAgMHgwIDB4NDAwMDAwMDttdy5iIDB4ODAwODAwMCAweDAgMHg0MDAwMDAw
O3NmIHJlYWQgMHg4MDA4MDAwIDB4MCAweDQwMDAwMDA7Y21wLmIgMHg4MDAwIDB4ODAwODAwMCAw
eDQwMDAwMDAKPiBTRjogNjcxMDg4NjQgYnl0ZXMgQCAweDAgRXJhc2VkOiBPSwo+IGRldmljZSAw
IHdob2xlIGNoaXAKPiBTRjogNjcxMDg4NjQgYnl0ZXMgQCAweDAgV3JpdHRlbjogT0sKPiBkZXZp
Y2UgMCB3aG9sZSBjaGlwCj4gU0Y6IDY3MTA4ODY0IGJ5dGVzIEAgMHgwIFJlYWQ6IE9LCj4gVG90
YWwgb2YgNjcxMDg4NjQgYnl0ZShzKSB3ZXJlIHRoZSBzYW1lCj4gCj4gVGhhbmtzCj4gVmVua2F0
ZXNoCj4gCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IE1hcmVrIFZhc3V0
IDxtYXJlay52YXN1dEBtYWlsYm94Lm9yZz4KPj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDIz
LCAyMDI0IDI6MTIgUE0KPj4gVG86IEFiYmFyYXB1LCBWZW5rYXRlc2ggPHZlbmthdGVzaC5hYmJh
cmFwdUBhbWQuY29tPjsgTWFyZWsgVmFzdXQKPj4gPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJv
eC5vcmc+OyB1LWJvb3RAbGlzdHMuZGVueC5kZQo+PiBDYzogQW5kcmUgUHJ6eXdhcmEgPGFuZHJl
LnByenl3YXJhQGFybS5jb20+OyBBc2hvayBSZWRkeSBTb21hCj4+IDxhc2hvay5yZWRkeS5zb21h
QGFtZC5jb20+OyBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT47Cj4+IE1p
Y2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPjsgU2ltZWssIE1pY2hhbCA8bWljaGFsLnNp
bWVrQGFtZC5jb20+Owo+PiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbT47IFBhdHJpY2sgRGVsYXVuYXkKPj4gPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+
OyBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+OyBRdWVudGluCj4+IFNjaHVseiA8cXVl
bnRpbi5zY2h1bHpAY2hlcnJ5LmRlPjsgU2VhbiBBbmRlcnNvbiA8c2VhbmdhMkBnbWFpbC5jb20+
Owo+PiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz47IFRha2FoaXJvIEt1d2Fubwo+PiA8
VGFrYWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbT47IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5j
b20+OyBUdWRvcgo+PiBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+OyB1Ym9vdC1z
dG0zMkBzdC1tZC0KPj4gbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+PiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvNl0gUmV2ZXJ0ICJzcGk6IHp5bnFfcXNwaTogQWRkIHBhcmFsbGVsIG1lbW9yaWVzIHN1
cHBvcnQgaW4KPj4gUVNQSSBkcml2ZXIiCj4+Cj4+IE9uIDEwLzIzLzI0IDU6MTggQU0sIEFiYmFy
YXB1LCBWZW5rYXRlc2ggd3JvdGU6Cj4+PiBIaSBNYXJlaywKPj4+IFRoZXJlIHdhcyBzb21lIGlz
c3VlIGFuZCBmaXggaXMgc2VudAo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290LzIw
MjQxMDE4MDgyNjQ0LjIyNDk1LTEtdmVua2F0ZXNoLmFiYmFyYQo+Pj4gcHVAYW1kLmNvbS9ULyN1
Cj4+Cj4+IElzIHRoaXMgb25lIGZpeCBvciB0aHJlZSBmaXhlcyBmb3IgdGhyZWUgZGlmZmVyZW50
IGlzc3VlcyA/Cj4+Cj4+IFRoaXMgc2VlbXMgdG8gZml4IFJFQUQgZXJyb3JzLCB3aGljaCBpcyBh
cHBhcmVudGx5IGFub3RoZXIgZXJyb3IgaW50cm9kdWNlZCBieSB0aGlzCj4+IHN0dWZmLiBJbiBt
eSBjYXNlLCBwbGFpbiBhbmQgc2ltcGx5ICdzZiBwcm9iZSA7IHNmIHVwZGF0ZScgY29tYmluYXRp
b24gd2l0aCBzaW5nbGUgbm9uLQo+PiBzdGFja2VkIFNQSSBOT1IgZG9lcyBub3Qgd29yay4gV2Fz
IHN1Y2ggYSBzaW1wbGUgY29uZmlndXJhdGlvbiBldmVyIHRlc3RlZCA/Cj4+Cj4+PiBOb3Qgc3Vy
ZSB3ZSBuZWVkIHRvIHJldmVydCB3aG9sZSBwYXJhbGxlbC9zdGFja2VkIHN1cHBvcnQ/Cj4+IFBs
ZWFzZSBzdG9wIHRvcC1wb3N0aW5nLgoKWW91IHJhbiBjb21wbGV0ZWx5IGRpZmZlcmVudCB0ZXN0
IG9uIGNvbXBsZXRlbHkgZGlmZmVyZW50IGNoaXAuCgpTdG9wIHRvcCBwb3N0aW5nLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
