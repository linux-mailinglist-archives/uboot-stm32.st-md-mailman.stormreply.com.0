Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82FD6889
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 19:34:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5B0AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 17:34:57 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2FDFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 17:34:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46sQg317YSz1rZmG;
 Mon, 14 Oct 2019 19:34:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46sQg300xTz1qxB6;
 Mon, 14 Oct 2019 19:34:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id CvUv5JhWKzuS; Mon, 14 Oct 2019 19:34:53 +0200 (CEST)
X-Auth-Info: DGfrQ+aTozci6eZGUfYSWhKwR4mPRIRew8o0wh+BZMo=
Received: from crub (p54833695.dip0.t-ipconnect.de [84.131.54.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 14 Oct 2019 19:34:53 +0200 (CEST)
Date: Mon, 14 Oct 2019 19:34:53 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Yannick =?UTF-8?B?RmVydHLDqQ==?= <yannick.fertre@st.com>
Message-ID: <20191014193453.6c6a7cdf@crub>
In-Reply-To: <1570454955-21298-14-git-send-email-yannick.fertre@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
 <1570454955-21298-14-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Cc: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v5 13/15] ARM: dts: stm32mp1: add dsi host
 for stm32mp157c-dk2 board
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

T24gTW9uLCA3IE9jdCAyMDE5IDE1OjI5OjEzICswMjAwCllhbm5pY2sgRmVydHLDqSB5YW5uaWNr
LmZlcnRyZUBzdC5jb20gd3JvdGU6Cgo+IFRoZSBuZXcgY2xhc3MgZHNpIGhvc3QgYWxsb3dzIHRo
ZSBtYW5hZ2VtZW50IG9mIHRoZSBicmlkZ2UgRFBJIHRvIERTSS4KPiBUaGlzIGJyaWRnZSBpcyBl
bWJlZGRlZCBpbiB0aGUgY2hpcHNldCBtcDEgKGNvbWUgZnJvbSBzeW5vcHN5cyBjb21wYW55KS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNv
bT4KPiAtLS0KPiAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWRrMi11LWJvb3QuZHRzaSB8IDcg
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpBcHBsaWVkIHRvIHUt
Ym9vdC12aWRlby9tYXN0ZXIsIHRoYW5rcyEKCi0tCkFuYXRvbGlqCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
