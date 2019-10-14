Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0D7D686C
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 19:26:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01B70C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 17:26:00 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55886C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 17:25:58 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46sQSj3cqxz1rhsZ;
 Mon, 14 Oct 2019 19:25:57 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46sQSj2FPfz1qxBD;
 Mon, 14 Oct 2019 19:25:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id E8WNZzQ7rt2M; Mon, 14 Oct 2019 19:25:56 +0200 (CEST)
X-Auth-Info: UH4VTFsjjnFIYzXsVdO/PDjL/spTdLihldBz5ILKuFI=
Received: from crub (p54833695.dip0.t-ipconnect.de [84.131.54.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 14 Oct 2019 19:25:56 +0200 (CEST)
Date: Mon, 14 Oct 2019 19:25:55 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Yannick =?UTF-8?B?RmVydHLDqQ==?= <yannick.fertre@st.com>
Message-ID: <20191014192555.631fca61@crub>
In-Reply-To: <1570454955-21298-5-git-send-email-yannick.fertre@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
 <1570454955-21298-5-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Cc: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v5 04/15] video: add support of MIPI DSI
	interface
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

T24gTW9uLCA3IE9jdCAyMDE5IDE1OjI5OjA0ICswMjAwCllhbm5pY2sgRmVydHLDqSB5YW5uaWNr
LmZlcnRyZUBzdC5jb20gd3JvdGU6Cgo+IE1pcGlfZGlzcGxheS5jIGNvbnRhaW5zIGEgc2V0IG9m
IGRzaSBoZWxwZXJzLgo+IFRoaXMgZmlsZSBpcyBhIGNvcHkgb2YgZmlsZSBkcm1fbWlwaV9kc2ku
YyAobGludXgga2VybmVsKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlh
bm5pY2suZmVydHJlQHN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9LY29uZmlnICAgIHwg
ICA4ICsKPiAgZHJpdmVycy92aWRlby9NYWtlZmlsZSAgIHwgICAxICsKPiAgZHJpdmVycy92aWRl
by9taXBpX2RzaS5jIHwgODI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIGluY2x1ZGUvbWlwaV9kc2kuaCAgICAgICB8IDQ2NiArKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDEzMDMgaW5zZXJ0aW9ucygrKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9taXBpX2RzaS5jCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL21pcGlfZHNpLmgKCkFwcGxpZWQgdG8gdS1ib290LXZpZGVvL21hc3Rl
ciwgdGhhbmtzIQoKLS0KQW5hdG9saWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
