Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE93D6876
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 19:29:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45B8AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 17:29:46 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3970C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 17:29:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46sQY43Nfxz1rhrw;
 Mon, 14 Oct 2019 19:29:44 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46sQY42QGLz1qxB6;
 Mon, 14 Oct 2019 19:29:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id CfSJAkwQV3ch; Mon, 14 Oct 2019 19:29:43 +0200 (CEST)
X-Auth-Info: p6NAoWoXzb2IDGvxGlivyZLiLEEeTJZhAWDFYENRrw4=
Received: from crub (p54833695.dip0.t-ipconnect.de [84.131.54.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 14 Oct 2019 19:29:43 +0200 (CEST)
Date: Mon, 14 Oct 2019 19:29:42 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Yannick =?UTF-8?B?RmVydHLDqQ==?= <yannick.fertre@st.com>
Message-ID: <20191014192942.3efd1841@crub>
In-Reply-To: <1570454955-21298-8-git-send-email-yannick.fertre@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
 <1570454955-21298-8-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Cc: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v5 07/15] video: add support of STM32 MIPI
 DSI controller driver
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

T24gTW9uLCA3IE9jdCAyMDE5IDE1OjI5OjA3ICswMjAwCllhbm5pY2sgRmVydHLDqSB5YW5uaWNr
LmZlcnRyZUBzdC5jb20gd3JvdGU6Cgo+IEFkZCB0aGUgU1RNMzIgRFNJIGNvbnRyb2xsZXIgZHJp
dmVyIHRoYXQgdXNlcyB0aGUgU3lub3BzeXMgRGVzaWduV2FyZQo+IE1JUEkgRFNJIGhvc3QgY29u
dHJvbGxlciBicmlkZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5u
aWNrLmZlcnRyZUBzdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vc3RtMzIvS2NvbmZpZyAg
ICAgfCAgIDkgKwo+ICBkcml2ZXJzL3ZpZGVvL3N0bTMyL01ha2VmaWxlICAgIHwgICAxICsKPiAg
ZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9kc2kuYyB8IDQ5MCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTAwIGluc2VydGlvbnMo
KykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vc3RtMzIvc3RtMzJfZHNpLmMK
CkFwcGxpZWQgdG8gdS1ib290LXZpZGVvL21hc3RlciwgdGhhbmtzIQoKLS0KQW5hdG9saWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMy
IG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290
LXN0bTMyCg==
