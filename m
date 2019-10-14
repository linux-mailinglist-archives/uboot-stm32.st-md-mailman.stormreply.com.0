Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F84BD6870
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 19:28:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25D1BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 17:28:13 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBC73C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 17:28:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46sQWH3gQpz1rHDx;
 Mon, 14 Oct 2019 19:28:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46sQWH2hwdz1qxBF;
 Mon, 14 Oct 2019 19:28:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id OprWGXvDR9Xa; Mon, 14 Oct 2019 19:28:10 +0200 (CEST)
X-Auth-Info: HXPpmfZOAaPNCO2neepganoaOZPw+HBIgsZIVu9NR1Y=
Received: from crub (p54833695.dip0.t-ipconnect.de [84.131.54.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 14 Oct 2019 19:28:10 +0200 (CEST)
Date: Mon, 14 Oct 2019 19:28:09 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Yannick =?UTF-8?B?RmVydHLDqQ==?= <yannick.fertre@st.com>
Message-ID: <20191014192809.71045a27@crub>
In-Reply-To: <1570454955-21298-6-git-send-email-yannick.fertre@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
 <1570454955-21298-6-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Cc: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v5 05/15] dm: Add a dsi host uclass
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

T24gTW9uLCA3IE9jdCAyMDE5IDE1OjI5OjA1ICswMjAwCllhbm5pY2sgRmVydHLDqSB5YW5uaWNr
LmZlcnRyZUBzdC5jb20gd3JvdGU6Cgo+IERpc3BsYXkgU2VyaWFsIEludGVyZmFjZSAoRFNJKSBo
b3N0IGNhbiB1c2VmdWxseSBiZSBtb2RlbGxlZAo+IGFzIHRoZWlyIG93biB1Y2xhc3MuCj4gRFNJ
IGRlZmluZXMgYSBzZXJpYWwgYnVzIGFuZCBhIGNvbW11bmljYXRpb24gcHJvdG9jb2wKPiBiZXR3
ZWVuIHRoZSBob3N0IGFuZCB0aGUgZGV2aWNlIChwYW5lbCwgYnJpZGdlKS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KPiAtLS0KPiAg
YXJjaC9zYW5kYm94L2R0cy9zYW5kYm94LmR0cyAgICAgfCAgNiArKy0KPiAgY29uZmlncy9zYW5k
Ym94X2RlZmNvbmZpZyAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvdmlkZW8vS2NvbmZpZyAgICAg
ICAgICAgIHwgMTEgKysrKysKPiAgZHJpdmVycy92aWRlby9NYWtlZmlsZSAgICAgICAgICAgfCAg
MiArCj4gIGRyaXZlcnMvdmlkZW8vZHNpLWhvc3QtdWNsYXNzLmMgIHwgMzkgKysrKysrKysrKysr
KysrKysKPiAgZHJpdmVycy92aWRlby9zYW5kYm94X2RzaV9ob3N0LmMgfCA5MCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvZG0vdWNsYXNzLWlkLmgg
ICAgICAgICAgIHwgIDEgKwo+ICBpbmNsdWRlL2RzaV9ob3N0LmggICAgICAgICAgICAgICB8IDcz
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHRlc3QvZG0vTWFrZWZpbGUgICAg
ICAgICAgICAgICAgIHwgIDEgKwo+ICB0ZXN0L2RtL2RzaV9ob3N0LmMgICAgICAgICAgICAgICB8
IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEwIGZpbGVzIGNoYW5nZWQsIDI4MSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L3ZpZGVvL2RzaS1ob3N0LXVjbGFzcy5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Zp
ZGVvL3NhbmRib3hfZHNpX2hvc3QuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kc2lf
aG9zdC5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0L2RtL2RzaV9ob3N0LmMKCkZpeGVkIHRl
c3QgKC4vdS1ib290IC0tZmR0IGFyY2gvc2FuZGJveC9kdHMvdGVzdC5kdGIgLS1jb21tYW5kICJ1
dCBkbSBkc2lfaG9zdCIpCmFuZCBhcHBsaWVkIHRvIHUtYm9vdC12aWRlby9tYXN0ZXIsIHRoYW5r
cyEKCi0tCkFuYXRvbGlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
