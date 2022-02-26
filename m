Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC34C5788
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Feb 2022 19:37:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05FBAC60479;
	Sat, 26 Feb 2022 18:37:34 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC292C57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Feb 2022 18:37:31 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id j2so10151502oie.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Feb 2022 10:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qA0QsO8WhEQpNVRqnpXxGqmWFWI6jcY2uGZSwh2Ii/g=;
 b=KkkvX2YIu61CgM4JB5DRkNssfZIwEuTS1hg3nzfK0AN+WOBSXpwTRei0s1PneYxbqn
 FQ/16uwvsqUK/amoFYCqWJbrPkCZ4U0D14zW7P1Fun6KbMS3yRd2VvK3jObX4VPm9DXn
 4DSReL3YzRJ078grgR9Tl3bb38OQh5p87yhg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qA0QsO8WhEQpNVRqnpXxGqmWFWI6jcY2uGZSwh2Ii/g=;
 b=tKHP+KVl0Bqyd5IKzx8KpdQNhkG+IRdtPmvQezTx4WtoiV/cIzN8xIRCpS+rk8oCLq
 BzHDpbiArey1FkdYjvfL0p/P3XykWuP79ph4sV5fsJl8KG8VmAYE2wZhZ8RoHBCZe+6f
 wdm5qpXajZfKVFPK9kMB00JWh64mQOWMPZBLp/wdHsnjYQInTTfzmZaqKlB1h7usClfs
 9/9GQnpimuyGh/GqPThViuV1tbCbdaRZJetB42lxoWrYx1sUwgV8rgycno9qtwtL7KVl
 k6Y+VS1xCuxctNABrVAQ3qvF83VYri8Z5zzy8tXu1DOvBBt23ocTAQwwHP9cKwAlSy3z
 78eQ==
X-Gm-Message-State: AOAM5331/mdtsqQxvKvn7YF34BY3fXOmZVpfv3w7Ig8c87N9MrELM3Rc
 C7FuFWRJdThJ7NFcSyq/7UjuaB2vmXKcIrxfVhQj2w==
X-Google-Smtp-Source: ABdhPJw0FihSc+6Hlj2vHhqE2H/SzE7X8rQNxYujkV0RrI5cQRN/I3VVisGxfln6IaaCF3RssyRQ3j6HKGvQ8UDhTxA=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr3595835oiw.112.1645900650490; Sat, 26
 Feb 2022 10:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20220112105908.7388-1-patrice.chotard@foss.st.com>
 <CAPnjgZ0rq==OQPJHgfdd_2q58dH2Z+O_E0+KhnD4Ykk9FSLfmg@mail.gmail.com>
 <e4b1c0a9-2dac-f7b7-6a63-a83b6a515566@foss.st.com>
In-Reply-To: <e4b1c0a9-2dac-f7b7-6a63-a83b6a515566@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 26 Feb 2022 11:36:41 -0700
Message-ID: <CAPnjgZ1mhYfVQrhPju0tPLjFFym_zvnejy=W95HpK7ADzT635A@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Vignesh R <vigneshr@ti.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Marek Behun <marek.behun@nic.cz>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Konstantin Porotchkin <kostap@marvell.com>, Biwen Li <biwen.li@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Anji J <anji.jagarlmudi@nxp.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Igal Liberman <igall@marvell.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH] spi: Add spi_get_bus_and_cs() new use_dt
	param
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

SGkgUGF0cmljZSwKCk9uIE1vbiwgMzEgSmFuIDIwMjIgYXQgMDk6MTQsIFBhdHJpY2UgQ0hPVEFS
RAo8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+IEhpIFNpbW9uCj4KPiBP
biAxLzIxLzIyIDE2OjIwLCBTaW1vbiBHbGFzcyB3cm90ZToKPiA+IEhpIFBhdHJpY2UsCj4gPgo+
ID4gT24gV2VkLCAxMiBKYW4gMjAyMiBhdCAwMzo1OSwgUGF0cmljZSBDaG90YXJkCj4gPiA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEFkZCBzcGlfZmxhc2hf
cHJvYmVfYnVzX2NzKCkgYW5kIHNwaV9nZXRfYnVzX2FuZF9jcygpIG5ldyAidXNlX2R0Igo+ID4+
IHBhcmFtIHdoaWNoIGFsbG93cyB0byBzZWxlY3QgU1BJIHNwZWVkIGFuZCBtb2RlIGZyb20gRFQg
b3IgZnJvbQo+ID4+IGRlZmF1bHQgdmFsdWUgcGFzc2VkIGluIHBhcmFtZXRlcnMuCj4gPj4KPiA+
PiBTaW5jZSBjb21taXQgZTJlOTVlNWUyNTQyICgic3BpOiBVcGRhdGUgc3BlZWQvbW9kZSBvbiBj
aGFuZ2UiKQo+ID4+IHdoZW4gY2FsbGluZyAic2YgcHJvYmUiIG9yICJlbnYgc2F2ZSIgb24gU1BJ
IGZsYXNoLAo+ID4+IHNwaV9zZXRfc3BlZWRfbW9kZSgpIGlzIGNhbGxlZCB0d2ljZS4KPiA+Pgo+
ID4+IHNwaV9nZXRfYnVzX2FuZF9jcygpCj4gPj4gICAgICAgfC0tPiBzcGlfY2xhaW1fYnVzKCkK
PiA+PiAgICAgICB8ICAgICAgIHwtLT4gc3BpX3NldF9zcGVlZF9tb2RlKHNwZWVkIGFuZCBtb2Rl
IGZyb20gRFQpCj4gPj4gICAgICAgLi4uCj4gPj4gICAgICAgfC0tPiBzcGlfc2V0X3NwZWVkX21v
ZGUoZGVmYXVsdCBzcGVlZCBhbmQgbW9kZSB2YWx1ZSkKPiA+Pgo+ID4+IFRoZSBmaXJzdCBzcGlf
c2V0X3NwZWVkX21vZGUoKSBjYWxsIGlzIGRvbmUgd2l0aCBzcGVlZCBhbmQgbW9kZQo+ID4+IHZh
bHVlcyBmcm9tIERULCB3aGVyZWFzIHRoZSBzZWNvbmQgY2FsbCBpcyBkb25lIHdpdGggc3BlZWQK
PiA+PiBhbmQgbW9kZSBzZXQgdG8gZGVmYXVsdCB2YWx1ZSAoc3BlZWQgaXMgc2V0IHRvIENPTkZJ
R19TRl9ERUZBVUxUX1NQRUVEKQo+ID4+Cj4gPj4gVGhpcyBpcyBhbiBpc3N1ZSBiZWNhdXNlIFNQ
SSBmbGFzaCBwZXJmb3JtYW5jZSBhcmUgaW1wYWN0ZWQgYnkKPiA+PiB1c2luZyBkZWZhdWx0IHNw
ZWVkIHdoaWNoIGNhbiBiZSBsb3dlciB0aGFuIHRoZSBvbmUgZGVmaW5lZCBpbiBEVC4KPiA+Pgo+
ID4+IE9uZSBzb2x1dGlvbiBpcyB0byBzZXQgQ09ORklHX1NGX0RFRkFVTFRfU1BFRUQgdG8gdGhl
IHNwZWVkIGRlZmluZWQKPiA+PiBpbiBEVCwgYnV0IHdlIGxvb3NlIGZsZXhpYmlsaXR5IG9mZmVy
ZWQgYnkgRFQuCj4gPj4KPiA+PiBBbm90aGVyIGlzc3VlIGNhbiBiZSBlbmNvdW50ZXJlZCB3aXRo
IDIgU1BJIGZsYXNoZXMgdXNpbmcgMiBkaWZmZXJlbnQKPiA+PiBzcGVlZHMuIEluIHRoaXMgc3Bl
Y2lmaWMgY2FzZSB1c2FnZSBvZiBDT05GSUdfU0ZfREVGQVVMVF9TUEVFRCBpcyBub3QKPiA+PiBm
bGV4aWJsZSBjb21wYXJlZCB0byBnZXQgdGhlIDIgZGlmZmVyZW50IHNwZWVkcyBmcm9tIERULgo+
ID4+Cj4gPj4gQnkgYWRkaW5nIG5ldyBwYXJhbWV0ZXIgInVzZV9kdCIgdG8gc3BpX2ZsYXNoX3By
b2JlX2J1c19jcygpIGFuZCB0bwo+ID4+IHNwaV9nZXRfYnVzX2FuZF9jcygpLCB0aGlzIGFsbG93
cyB0byBmb3JjZSB1c2FnZSBvZiBlaXRoZXIgc3BlZWQgYW5kCj4gPj4gbW9kZSBmcm9tIERUICh1
c2VfZHQgPSB0cnVlKSBvciB0byB1c2Ugc3BlZWQgYW5kIG1vZGUgcGFyYW1ldGVyIHZhbHVlLgo+
ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRA
Zm9zcy5zdC5jb20+Cj4gPj4gQ2M6IE1hcmVrIEJlaHVuIDxtYXJlay5iZWh1bkBuaWMuY3o+Cj4g
Pj4gQ2M6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4+IENjOiBW
aWduZXNoIFIgPHZpZ25lc2hyQHRpLmNvbT4KPiA+PiBDYzogSm9lIEhlcnNoYmVyZ2VyIDxqb2Uu
aGVyc2hiZXJnZXJAbmkuY29tPgo+ID4+IENjOiBSYW1vbiBGcmllZCA8cmZyaWVkLmRldkBnbWFp
bC5jb20+Cj4gPj4gQ2M6IEx1a2FzeiBNYWpld3NraSA8bHVrbWFAZGVueC5kZT4KPiA+PiBDYzog
TWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gPj4gQ2M6IFdvbGZnYW5nIERlbmsgPHdkQGRl
bnguZGU+Cj4gPj4gQ2M6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+ID4+IENjOiBT
dGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+Cj4gPj4gQ2M6ICJQYWxpIFJvaMOhciIgPHBhbGlAa2Vy
bmVsLm9yZz4KPiA+PiBDYzogS29uc3RhbnRpbiBQb3JvdGNoa2luIDxrb3N0YXBAbWFydmVsbC5j
b20+Cj4gPj4gQ2M6IElnYWwgTGliZXJtYW4gPGlnYWxsQG1hcnZlbGwuY29tPgo+ID4+IENjOiBC
aW4gTWVuZyA8Ym1lbmcuY25AZ21haWwuY29tPgo+ID4+IENjOiBQcmF0eXVzaCBZYWRhdiA8cC55
YWRhdkB0aS5jb20+Cj4gPj4gQ2M6IFNlYW4gQW5kZXJzb24gPHNlYW5nYTJAZ21haWwuY29tPgo+
ID4+IENjOiBBbmppIEogPGFuamkuamFnYXJsbXVkaUBueHAuY29tPgo+ID4+IENjOiBCaXdlbiBM
aSA8Yml3ZW4ubGlAbnhwLmNvbT4KPiA+PiBDYzogUHJpeWFua2EgSmFpbiA8cHJpeWFua2EuamFp
bkBueHAuY29tPgo+ID4+IENjOiBDaGFpdGFueWEgU2FraW5hbSA8Y2hhaXRhbnlhLnNha2luYW1A
bnhwLmNvbT4KPiA+PiAtLS0KPiA+Pgo+ID4+ICBib2FyZC9DWi5OSUMvdHVycmlzX21veC90dXJy
aXNfbW94LmMgfCAgMiArLQo+ID4+ICBjbWQvc2YuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgNSArKysrLQo+ID4+ICBjbWQvc3BpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMiArLQo+ID4+ICBkcml2ZXJzL210ZC9zcGkvc2YtdWNsYXNzLmMgICAgICAgICAgfCAgOCAr
KysrLS0tLQo+ID4+ICBkcml2ZXJzL25ldC9mbS9mbS5jICAgICAgICAgICAgICAgICAgfCAgNSAr
KystLQo+ID4+ICBkcml2ZXJzL25ldC9wZmVfZXRoL3BmZV9maXJtd2FyZS5jICAgfCAgMiArLQo+
ID4+ICBkcml2ZXJzL25ldC9zbmlfbmV0c2VjLmMgICAgICAgICAgICAgfCAgMyArKy0KPiA+PiAg
ZHJpdmVycy9zcGkvc3BpLXVjbGFzcy5jICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KPiA+PiAg
ZHJpdmVycy91c2IvZ2FkZ2V0L21heDM0MjBfdWRjLmMgICAgIHwgIDIgKy0KPiA+PiAgZW52L3Nm
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+PiAgaW5jbHVkZS9zcGku
aCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKystLS0tCj4gPj4gIGluY2x1ZGUvc3Bp
X2ZsYXNoLmggICAgICAgICAgICAgICAgICB8ICAyICstCj4gPj4gIHRlc3QvZG0vc3BpLmMgICAg
ICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrLS0tLS0tLQo+ID4+ICAxMyBmaWxlcyBj
aGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBJIHRoaW5r
IHRoaXMgaXMgYSBnb29kIGlkZWEsIGJ1dCBzaG91bGQgdXNlIGEgc2VwYXJhdGUgZnVuY3Rpb24g
bmFtZQo+ID4gaW5zdGVhZCBvZiBhZGRpbmcgYW4gYXJndW1lbnQsIHNpbmNlIGl0IGRvZXNuJ3Qg
bWFrZSBzZW5zZSB0byBwYXNzCj4gPiBwYXJhbWV0ZXJzIHRoYXQgYXJlIGlnbm9yZWQuCj4KPiBJ
IGFtIGNvbmZ1c2VkLCBkbyB5b3UgbWVhbiBkdXBsaWNhdGUgc3BpX2ZsYXNoX3Byb2JlX2J1c19j
cygpIGluIGFub3RoZXIgZnVuY3Rpb24gc3BpX2ZsYXNoX3Byb2JlX2J1c19jc19kZWZhdWx0KCkK
PiBmb3IgZXhhbXBsZSA/Cj4gSW4gdGhlIGZvcm1lciBzcGlfZ2V0X2J1c19hbmRfY3MoKSB3aWxs
IGJlIGNhbGxlZCB3aXRoICJ1c2VfZHQiIHBhcmFtIHNldCB0byB0cnVlIGFuZCBpbiB0aGUgbGF0
dGVyCj4gInVzZV9kdCIgcGFyYW0gd2lsbCBiZSBzZXQgdG8gZmFsc2UgPwo+Cj4gc3BpX2ZsYXNo
X3Byb2JlX2J1c19jcygpICAgICAgICAgPT4gc3BpX2dldF9idXNfYW5kX2NzKC4uLCB0cnVlICwg
Li4uKQo+IHNwaV9mbGFzaF9wcm9iZV9idXNfY3NfZGVmYXVsdCgpID0+IHNwaV9nZXRfYnVzX2Fu
ZF9jcyguLiwgZmFsc2UsIC4uLikKCk1heWJlIHJlbmFtZSBzcGlfZ2V0X2J1c19hbmRfY3MoKSB0
byBfc3BpX2dldF9idXNfYW5kX2NzKCkgPwoKSXQgc2VlbXMgdG8gbWUgdGhhdCBpZiB1c2VfZHQg
aXMgcHJvdmlkZWQsIHdlIHNob3VsZCBhY3R1YWxseSBiZSB1c2luZwpEVCBhbmQgbm90IGNhbGxp
bmcgdGhpcyBmdW5jdGlvbiBhdCBhbGwuIFdlIHNob3VsZCBqdXN0IGJlIGFibGUgdG8KcHJvYmUg
dGhlIGRldmljZSBhbmQgdGhlIHJpZ2h0IHRoaW5ncyBzaG91bGQgaGFwcGVuLgoKSWYgd2UgbXVz
dCB1c2UgdGhlIGJ1cyBhbmQgY3MgbnVtYmVycywgYW5kIHVzZV9kdCBpcyB0cnVlLCB0aGVuIHdl
CnNob3VsZCBub3QgbmVlZCB0byBzcGVjaWZ5IHRoZSBtb2RlLCBzcGVlZCwgZXRjLiBTbyB0aGUg
YXJncyB0byB0aGF0CmZ1bmN0aW9uIHNob3VsZCBiZSBkaWZmZXJlbnQuCgpTbyBJIGJlbGlldmUg
dGhlIHR3byBmdW5jdGlvbnMgc2hvdWxkIGhhdmUgcXVpdGUgZGlmZmVyZW50IGFyZ3MuClBlcmhh
cHMgdGhlIGNvcmUgcGFydCBvZiBzcGlfZ2V0X2J1c19hbmRfY3MoKSBjb3VsZCBiZSBzcGxpdCBv
dXQ/IEkKanVzdCBmZWVsIHRoZXJlIGFyZSB3YXkgdG9vIG1hbnkgYXJndW1lbnRzIGFuZCBhZGRp
bmcgYW4gYXJndW1lbnQgdGhhdApjYW5jZWxzIG91dCBzb21lIG9mIHRoZSBvdGhlcnMganVzdCBt
YWtlcyBhIGNvbmZ1c2luZyBtZXNzLgoKPgo+IFRoYW5rcwo+IFBhdHJpY2UKPiA+Cj4gPiBBbHNv
IHdlIHNob3VsZCBwcm9iYWJseSBoYXZlIGRldmljZXRyZWUgYXMgdGhlIGRlZmF1bHQgKHRoZSBi
YXNlIGZ1bmN0aW9uIG5hbWUpLgo+ID4KClNlZSB0aGF0IGFsc28gXgoKUmVnYXJkcywKU2ltb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
