Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 884FD9ACC1C
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2024 16:19:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B8DDC71289;
	Wed, 23 Oct 2024 14:19:16 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9272C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 14:19:14 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4XYWPr2B32z9t3Z;
 Wed, 23 Oct 2024 16:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729693152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ImCe65XCRwZ33kZDAq1DEdi20fPLVE1v1rsMfqwSzFY=;
 b=pD9YLXmn/O/vvHn2fMgH8Zwior3LW+sfyjek1uLwlIwRwkobeCTsswVKL7iOApJUN5DD07
 EA6yxvEs+kZb1pZEqln4adTyM28j+YttqMdE0VheW5ThTWVuH+UE4iYGu74F3Jw+ywO9pu
 OW49Jio6sxMtoaIBuexr6zx2W95zZ7ovaXO3+OutK72F61ILskfBTJawQN9HgtsDt9c4E+
 rjTcvOsfOU+hGvnnML5ArD/Sj6IS2adLqmoHMI48I2jyy7yJgTfEUNtcHMz8Yo4tSI1rHY
 VkVjG+kVPizM8q0FGnq91EqRh5ugdIkhqkUibjZEpnIsaYvcWeVrZgBtDLET4g==
Message-ID: <a78899c6-aecf-4eaa-a9c9-8f11758542cd@mailbox.org>
Date: Wed, 23 Oct 2024 16:19:07 +0200
MIME-Version: 1.0
To: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
 <SA1PR12MB869767A8D003AB114830D46A984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <03389ee7-3da9-4160-a193-00fd517ad56e@mailbox.org>
 <SA1PR12MB869722D8E2019193343572AF984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <SA1PR12MB869722D8E2019193343572AF984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
X-MBO-RS-META: tjx7zew5dmqefmw1okktpza6dcfsnetd
X-MBO-RS-ID: c22be40d60033563f79
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

T24gMTAvMjMvMjQgNDoxNCBQTSwgQWJiYXJhcHUsIFZlbmthdGVzaCB3cm90ZToKPiBIaSwKPiAK
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmVr
LnZhc3V0QG1haWxib3gub3JnPgo+PiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMjMsIDIwMjQg
NjoxNSBQTQo+PiBUbzogQWJiYXJhcHUsIFZlbmthdGVzaCA8dmVua2F0ZXNoLmFiYmFyYXB1QGFt
ZC5jb20+OyB1LWJvb3RAbGlzdHMuZGVueC5kZQo+PiBDYzogQW5kcmUgUHJ6eXdhcmEgPGFuZHJl
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
cHBvcnQgaW4KPj4gUVNQSSBkcml2ZXIiCj4+Cj4+IE9uIDEwLzIzLzI0IDExOjA3IEFNLCBBYmJh
cmFwdSwgVmVua2F0ZXNoIHdyb3RlOgo+Pj4gSGksCj4+PiBUZXN0ZWQgd2l0aCB0aGUgbm9uLXN0
YWNrZWQgZGVmYXVsdCBzaW5nbGUgY29uZmlndXJhdGlvbiBvbiBaeW5xTVAgemN1MTAyIGJvYXJk
Cj4+IGFuZCBkaWRu4oCZdCBzZWUgYW55IGlzc3VlLgo+Pj4KPj4+IFp5bnFNUD4gc2YgcHJvYmUg
MCAwIDAKPj4+IFNGOiBEZXRlY3RlZCBtdDI1cXU1MTJhIHdpdGggcGFnZSBzaXplIDI1NiBCeXRl
cywgZXJhc2Ugc2l6ZSA2NCBLaUIsCj4+PiB0b3RhbCA2NCBNaUIKPj4+IFp5bnFNUD4gc2YgZXJh
c2UgMHgwIDB4NDAwMDAwMDttdy5iIDB4ODAwMCBhYWJiY2NkZCAweDQwMDAwMDA7c2Ygd3JpdGUK
Pj4+IFp5bnFNUD4gMHg4MDAwIDB4MCAweDQwMDAwMDA7bXcuYiAweDgwMDgwMDAgMHgwIDB4NDAw
MDAwMDtzZiByZWFkCj4+PiBaeW5xTVA+IDB4ODAwODAwMCAweDAgMHg0MDAwMDAwO2NtcC5iIDB4
ODAwMCAweDgwMDgwMDAgMHg0MDAwMDAwCj4+PiBTRjogNjcxMDg4NjQgYnl0ZXMgQCAweDAgRXJh
c2VkOiBPSwo+Pj4gZGV2aWNlIDAgd2hvbGUgY2hpcAo+Pj4gU0Y6IDY3MTA4ODY0IGJ5dGVzIEAg
MHgwIFdyaXR0ZW46IE9LCj4+PiBkZXZpY2UgMCB3aG9sZSBjaGlwCj4+PiBTRjogNjcxMDg4NjQg
Ynl0ZXMgQCAweDAgUmVhZDogT0sKPj4+IFRvdGFsIG9mIDY3MTA4ODY0IGJ5dGUocykgd2VyZSB0
aGUgc2FtZQo+Pj4KPj4+IFRoYW5rcwo+Pj4gVmVua2F0ZXNoCj4+Pgo+Pj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4+Pj4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0QG1haWxi
b3gub3JnPgo+Pj4+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyMywgMjAyNCAyOjEyIFBNCj4+
Pj4gVG86IEFiYmFyYXB1LCBWZW5rYXRlc2ggPHZlbmthdGVzaC5hYmJhcmFwdUBhbWQuY29tPjsg
TWFyZWsgVmFzdXQKPj4+PiA8bWFyZWsudmFzdXQrcmVuZXNhc0BtYWlsYm94Lm9yZz47IHUtYm9v
dEBsaXN0cy5kZW54LmRlCj4+Pj4gQ2M6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBh
cm0uY29tPjsgQXNob2sgUmVkZHkgU29tYQo+Pj4+IDxhc2hvay5yZWRkeS5zb21hQGFtZC5jb20+
OyBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT47Cj4+Pj4gTWljaGFlbCBX
YWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+OyBTaW1laywgTWljaGFsCj4+Pj4gPG1pY2hhbC5zaW1l
a0BhbWQuY29tPjsgUGF0cmljZSBDaG90YXJkCj4+Pj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbT47IFBhdHJpY2sgRGVsYXVuYXkKPj4+PiA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNv
bT47IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2QHRpLmNvbT47Cj4+Pj4gUXVlbnRpbiBTY2h1bHog
PHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT47IFNlYW4gQW5kZXJzb24KPj4+PiA8c2VhbmdhMkBn
bWFpbC5jb20+OyBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz47IFRha2FoaXJvIEt1d2Fu
bwo+Pj4+IDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPjsgVG9tIFJpbmkgPHRyaW5pQGtv
bnN1bGtvLmNvbT47IFR1ZG9yCj4+Pj4gQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3Jn
PjsgdWJvb3Qtc3RtMzJAc3QtbWQtCj4+Pj4gbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMS82XSBSZXZlcnQgInNwaTogenlucV9xc3BpOiBBZGQgcGFyYWxs
ZWwKPj4+PiBtZW1vcmllcyBzdXBwb3J0IGluIFFTUEkgZHJpdmVyIgo+Pj4+Cj4+Pj4gT24gMTAv
MjMvMjQgNToxOCBBTSwgQWJiYXJhcHUsIFZlbmthdGVzaCB3cm90ZToKPj4+Pj4gSGkgTWFyZWss
Cj4+Pj4+IFRoZXJlIHdhcyBzb21lIGlzc3VlIGFuZCBmaXggaXMgc2VudAo+Pj4+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy91LWJvb3QvMjAyNDEwMTgwODI2NDQuMjI0OTUtMS12ZW5rYXRlc2gu
YWJiYQo+Pj4+PiByYQo+Pj4+PiBwdUBhbWQuY29tL1QvI3UKPj4+Pgo+Pj4+IElzIHRoaXMgb25l
IGZpeCBvciB0aHJlZSBmaXhlcyBmb3IgdGhyZWUgZGlmZmVyZW50IGlzc3VlcyA/Cj4+Pj4KPj4+
PiBUaGlzIHNlZW1zIHRvIGZpeCBSRUFEIGVycm9ycywgd2hpY2ggaXMgYXBwYXJlbnRseSBhbm90
aGVyIGVycm9yCj4+Pj4gaW50cm9kdWNlZCBieSB0aGlzIHN0dWZmLiBJbiBteSBjYXNlLCBwbGFp
biBhbmQgc2ltcGx5ICdzZiBwcm9iZSA7IHNmCj4+Pj4gdXBkYXRlJyBjb21iaW5hdGlvbiB3aXRo
IHNpbmdsZSBub24tIHN0YWNrZWQgU1BJIE5PUiBkb2VzIG5vdCB3b3JrLiBXYXMgc3VjaAo+PiBh
IHNpbXBsZSBjb25maWd1cmF0aW9uIGV2ZXIgdGVzdGVkID8KPj4+Pgo+Pj4+PiBOb3Qgc3VyZSB3
ZSBuZWVkIHRvIHJldmVydCB3aG9sZSBwYXJhbGxlbC9zdGFja2VkIHN1cHBvcnQ/Cj4+Pj4gUGxl
YXNlIHN0b3AgdG9wLXBvc3RpbmcuCj4+Cj4+IFlvdSByYW4gY29tcGxldGVseSBkaWZmZXJlbnQg
dGVzdCBvbiBjb21wbGV0ZWx5IGRpZmZlcmVudCBjaGlwLgo+Pgo+PiBTdG9wIHRvcCBwb3N0aW5n
Lgo+IAo+IFNvcnJ5IGZvciB0b3AgcG9zdGluZwo+IAo+IFdpbGwgdHJ5IHRvIGdldCB0aGUgc3Bh
bnNpb24gZmxhc2ggcGFydCBhbmQgdHJ5IHRoZSBiZWxvdyB0ZXN0cy4KPiBBdCB0aGlzIHBvaW50
IHRyaWVkIHRlc3Rpbmcgb24gZGlmZmVyZW50IGJvYXJkIHdpdGggZGlmZmVyZW50IGZsYXNoIHBh
cnQuCj4gCj4gWnlucT4gc2YgcHJvYmUgMCAwIDAKPiBTRjogRGV0ZWN0ZWQgbXg2NmwxZzQ1ZyB3
aXRoIHBhZ2Ugc2l6ZSAyNTYgQnl0ZXMsIGVyYXNlIHNpemUgNjQgS2lCLCB0b3RhbCAxMjggTWlC
Cj4gWnlucT4gc2YgdXBkYXRlIDB4NDAwMDAwMCAwIDB4MTYwMDAwCj4gZGV2aWNlIDAgb2Zmc2V0
IDB4MCwgc2l6ZSAweDE2MDAwMAo+IDE0NDE3OTIgYnl0ZXMgd3JpdHRlbiwgMCBieXRlcyBza2lw
cGVkIGluIDUuNzM1cywgc3BlZWQgMjU3NDM1IEIvcwo+IAo+IFp5bnE+IHNmIGVyYXNlIDB4MCAw
eDQwMDAwMDA7bXcuYiAweDgwMDAgYWFiYmNjZGQgMHg0MDAwMDAwO3NmIHdyaXRlIDB4ODAwMCAw
eDAgMHg0MDAwMDAwO213LmIgMHg4MDA4MDAwIDB4MCAweDQwMDAwMDA7c2YgcmVhZCAweDgwMDgw
MDAgMHgwIDB4NDAwMDAwMDtjbXAuYiAweDgwMDAgMHg4MDA4MDAwIDB4NDAwMDAwMAo+IFNGOiA2
NzEwODg2NCBieXRlcyBAIDB4MCBFcmFzZWQ6IE9LCj4gZGV2aWNlIDAgb2Zmc2V0IDB4MCwgc2l6
ZSAweDQwMDAwMDAKPiBTRjogNjcxMDg4NjQgYnl0ZXMgQCAweDAgV3JpdHRlbjogT0sKPiBkZXZp
Y2UgMCBvZmZzZXQgMHgwLCBzaXplIDB4NDAwMDAwMAo+IFNGOiA2NzEwODg2NCBieXRlcyBAIDB4
MCBSZWFkOiBPSwo+IFRvdGFsIG9mIDY3MTA4ODY0IGJ5dGUocykgd2VyZSB0aGUgc2FtZQpDb21t
aXQgbWVzc2FnZSByZWFkczoKCiIKdGhpcyBubyBsb25nZXIgd29ya3M6Cgo9PiBzZiBwcm9iZSAm
JiBzZiB1cGRhdGUgMHg1MDAwMDAwMCAwIDB4MTYwMDAwClNGOiBEZXRlY3RlZCBzMjVmczUxMnMg
d2l0aCBwYWdlIHNpemUgMjU2IEJ5dGVzLCBlcmFzZSBzaXplIDI1NiBLaUIsIAp0b3RhbCA2NCBN
aUIKZGV2aWNlIDAgb2Zmc2V0IDB4MCwgc2l6ZSAweDE2MDAwMApTUEkgZmxhc2ggZmFpbGVkIGlu
IHJlYWQgc3RlcAoiCgpZb3UgcmFuIGNvbXBsZXRlbHkgZGlmZmVyZW50IHRlc3Qgb24gY29tcGxl
dGVseSBkaWZmZXJlbnQgY2hpcC4KClRoZSB0ZXN0IGlzICJzZiBwcm9iZSAmJiBzZiB1cGRhdGUg
MHg1MDAwMDAwMCAwIDB4MTYwMDAwIiAsIGRpZCB5b3UgZXZlciAKdGVzdCAic2YgdXBkYXRlIiA/
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0
bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vi
b290LXN0bTMyCg==
