Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A6136A11
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Jan 2020 10:39:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E09DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Jan 2020 09:39:51 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58D8FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 09:39:47 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 77so1339829oty.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 01:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oF9pusWNybNOfRr3MKdMY0gs1Wyr9Ig63ryXijvi9II=;
 b=IvkShpwRzMG9ZfZC+7QSpEQqP+1MyZjD3IWhu5AgNKEdbLNLDVZRg4Dck96TJOvlLl
 nZyjli5us27Gb+eyJRSHY3AKH4RgLKL2pYPl208+oPR5RUh1eXbmk8usY9BxRdgQUUUJ
 nLWA1IbuR3JhSUsOz21rKLnfzi17DaNea6bbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oF9pusWNybNOfRr3MKdMY0gs1Wyr9Ig63ryXijvi9II=;
 b=bvBM62D/OVTb+AFfEN8dKE8V3LxRu6tSnYEVlqrv5X4u1fSJ6qgTtR+HWNHRUGPtE4
 +fsfJndonxZ6kSWOUvO6y8mawxrtCRCkNEgclLA/SfDDquy04/XK1CBRHG3C+IWJVwgU
 dCkwO91bX1Pe16fgG/BlfMi2MYhJHSd7ZHAfsSk/DC/bvKaGaeelWTs4X03NDAg+BO3e
 h7ule3mfnhBJFjrdyvzN4ctU0F45sZD7T5UGCCvDICdbjI/JOMkZeyOJ4z+DTzvQUo4y
 cnxl9UvV6SQh6Bi2O2lwxP4sdIBOHKpznF7JFiAAA/sTZoBlnM8j9+0vCFEq0PVVfa5t
 6PwA==
X-Gm-Message-State: APjAAAVdshYhELB0rAxPbzrQ5lQIcEwehT9vs8iItzqSUQDTb2HaAvkQ
 q29m8a66dcYqzrrRmVU7iSjH71S2HgiQRltRG6ddxA==
X-Google-Smtp-Source: APXvYqz+GKmErwc2JVVTSma/wj6lOyXlKU2xs4x4ooDAnkOPTMFOnbFPg/SRpcxVxydX6Tc4kpc7bu+GovZdbxWoqM8=
X-Received: by 2002:a9d:53c4:: with SMTP id i4mr1946058oth.48.1578649185990;
 Fri, 10 Jan 2020 01:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-15-patrick.delaunay@st.com>
 <CAPnjgZ2NNfwvxkY7jx9gWU0cWRDX_QMrYYrUCsdmf61pw_RHeA@mail.gmail.com>
 <18b4104304ad49e8a11d27ddcf0345ed@SFHDAG6NODE3.st.com>
In-Reply-To: <18b4104304ad49e8a11d27ddcf0345ed@SFHDAG6NODE3.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 10 Jan 2020 22:39:29 +1300
Message-ID: <CAPnjgZ02ggJAhA+fA_gFmM_LE_9iqVrZY29g_53updrG5KNdqA@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 14/14] test: pinmux: add
	pincontrol-gpio for pin configuration
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

SGkgUGF0cmljaywKCk9uIFRodSwgOSBKYW4gMjAyMCBhdCAyMzozMCwgUGF0cmljayBERUxBVU5B
WSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+IHdyb3RlOgo+Cj4gSGkgU2ltb24sCj4KPiA+IEZy
b206IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+ID4gU2VudDogbHVuZGkgMzAgZMOp
Y2VtYnJlIDIwMTkgMDI6MjEKPiA+Cj4gPiBPbiBUdWUsIDI2IE5vdiAyMDE5IGF0IDAxOjQ5LCBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4KPiA+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBBZGQgYSBzaW1wbGUgcGluY29udHJvbCBhc3NvY2lhdGVkIHRvIHRoZSBzYW5kYm94
IGdwaW8gZHJpdmVyLCB0aGF0Cj4gPiA+IGFsbG93cyB0byBjaGVjayBwaW4gY29uZmlndXJhdGlv
biB3aXRoIHRoZSBjb21tYW5kIHBpbm11eC4KPiA+ID4KPiA+ID4gVGhlIHBtdXggdGVzdCBpcyBh
bHNvIHVwZGF0ZWQgdG8gdGVzdCBiZWhhdmlvciB3aXRoIDIgcGluY29udHJvbHMuCj4gPiA+Cj4g
PiA+IEV4YW1wbGUgdG8gY2hlY2sgTEVEIHBpbiBjb25maWd1cmF0aW9uOgo+ID4gPgo+ID4gPiA9
PiBwaW5tdXggbGlzdAo+ID4gPiB8IERldmljZSAgICAgICAgICAgICAgICAgICAgICAgIHwgRHJp
dmVyICAgICAgICAgICAgICAgICAgICAgICAgfCBQYXJlbnQKPiA+ID4gfCBwaW5jdHJsLWdwaW8g
ICAgICAgICAgICAgICAgICB8IHNhbmRib3hfcGluY3RybF9ncGlvICAgICAgICAgIHwgcm9vdF9k
cml2ZXIKPiA+ID4gfCBwaW5jdHJsICAgICAgICAgICAgICAgICAgICAgICB8IHNhbmRib3hfcGlu
Y3RybCAgICAgICAgICAgICAgIHwgcm9vdF9kcml2ZXIKPiA+ID4KPiA+ID4gPT4gcGlubXV4IGRl
diBwaW5jdHJsLWdwaW8KPiA+ID4KPiA+ID4gPT4gcGlubXV4IHN0YXR1cwo+ID4gPgo+ID4gPiBh
MCAgICAgICAgOiBncGlvIGlucHV0IC4KPiA+ID4gYTEgICAgICAgIDogZ3BpbyBpbnB1dCAuCj4g
PiA+IGEyICAgICAgICA6IGdwaW8gaW5wdXQgLgo+ID4gPiBhMyAgICAgICAgOiBncGlvIGlucHV0
IC4KPiA+ID4gYTQgICAgICAgIDogZ3BpbyBpbnB1dCAuCj4gPiA+IGE1ICAgICAgICA6IGdwaW8g
b3V0cHV0IC4KPiA+ID4gYTYgICAgICAgIDogZ3BpbyBvdXRwdXQgLgo+ID4gPiAuLi4KPiA+ID4K
PiA+ID4gU2VyaWUtY2M6IEhlaWtvIFNjaG9jaGVyIDxoc0BkZW54LmRlPgo+ID4gPiBTZXJpZS1j
YzogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gPgo+ID4gU2VyaWVzLWNjIDotKQo+
Cj4gT3VwcyA6LSkKPgo+Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVu
YXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPgo+ID4gPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4g
Q2hhbmdlcyBpbiB2MjoKPiA+ID4gLSBBZGFwdCBzYW5kYm94X3BpbmN0cmxfZ3BpbyBkcml2ZXIg
d2l0aCB0aGUgc2F2ZWQgZGlyX2ZsYWdzIGluCj4gPiA+ICAgc2FuZGJveCBncGlvIGRyaXZlcgo+
ID4gPiAtIHJlYmFzZSBvbiB2MjAyMC4wMS1yYzMKPiA+ID4KPiA+ID4gIGFyY2gvc2FuZGJveC9k
dHMvdGVzdC5kdHMgICAgfCAgNDggKysrKystLS0tCj4gPiA+ICBkcml2ZXJzL2dwaW8vc2FuZGJv
eC5jICAgICAgIHwgMTk1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+
ICB0ZXN0L3B5L3Rlc3RzL3Rlc3RfcGlubXV4LnB5IHwgIDEwICsrCj4gPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDIzMSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBSZXZpZXdl
ZC1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4KPiBUaGFua3MgZm9yIHRoZSBy
ZXZpZXcKPgo+IEkgYW0gcHJlcGFyaW5nIGEgdjMuCj4KPiBEbyB5b3UgdGhpbmsgSSBuZWVkIHRv
IHNwbGl0IHRoZSBwYXRjaAo+ICAgICAgICAgW1BBVENIIHYyIDA4LzE0XSBncGlvOiBhZGQgb3Bz
IGZvciBjb25maWd1cmF0aW9uIHdpdGggZGlyIGZsYWdzCj4KCkkgYW0gaW4gZmF2b3VyIG9mIHRo
YXQuCgpSZWdhcmRzLApTaW1vbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
