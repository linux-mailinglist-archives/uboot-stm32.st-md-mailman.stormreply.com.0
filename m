Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A088E3563
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2019 16:19:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8DFFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2019 14:19:45 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 753DAC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2019 14:19:43 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46zTs973V1z1qqlD;
 Thu, 24 Oct 2019 16:19:41 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46zTs94yMjz1qqkQ;
 Thu, 24 Oct 2019 16:19:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id mtKXMyQufCJa; Thu, 24 Oct 2019 16:19:40 +0200 (CEST)
X-Auth-Info: GnazSwwEl8/QLmxv2c8/1OMS2RncyzlmRSZ7l9G6oiA=
Received: from crub (p54833695.dip0.t-ipconnect.de [84.131.54.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 24 Oct 2019 16:19:40 +0200 (CEST)
Date: Thu, 24 Oct 2019 16:19:39 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Patrice CHOTARD <patrice.chotard@st.com>
Message-ID: <20191024161939.12fd6ebd@crub>
In-Reply-To: <2ef8752e-a6fd-fec3-ad94-63dcc48fdc13@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
 <1570454955-21298-2-git-send-email-yannick.fertre@st.com>
 <2d9bb18b-5775-00b6-2fdd-1b38dce1abcc@gmx.de>
 <2ef8752e-a6fd-fec3-ad94-63dcc48fdc13@st.com>
MIME-Version: 1.0
Cc: Albert Aribaud <albert.u.boot@aribaud.net>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v5 01/15] video: bmp: check resolutions of
	panel/bitmap
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

SGkgUGF0cmljZSwKCk9uIFRodSwgMjQgT2N0IDIwMTkgMTQ6MDU6NDEgKzAwMDAKUGF0cmljZSBD
SE9UQVJEIHBhdHJpY2UuY2hvdGFyZEBzdC5jb20gd3JvdGU6Ci4uLiAKPiBGb3IgaW5mb3JtYXRp
b24gYWxsIHRoaXMgc2VyaWVzIHBhdGNoZXMgaGF2ZSBiZWVuIGFwcGxpZWQgb24KPiB1LWJvb3Qv
bWFzdGVyIGV4Y2VwdHPCoCB0aGlzIG9uZS4KClllcywgSSBza2lwcGVkIHRoaXMgcGF0Y2ggd2hl
biBhcHBseWluZyB0aGUgc2VyaWVzIHNpbmNlIGl0IHdhcyB1bmRlcgpkaXNjdXNzaW9uLgogCj4g
VW5mb3J0dW5hdGVseSwgd2l0aG91dCB0aGlzIHBhdGNoLCBzdG0zMmY3NDYtZGlzY292ZXJ5IGJv
YXJkIGRvZXNuJ3QgYm9vdCBhbnltb3JlLgo+IAo+IEhlaW5yaWNoLCBjb3VsZCB0aGlzIHBhdGNo
IGJlIG1lcmdlZCwgd2FpdGluZyBmb3IgYSBjbGVhbiBwYXRjaCBmcm9tIFlhbm5pY2sgPwoKQXMg
ZmFyIGFzIEkgY2FuIHNlZSwgWWFubmljayBkaWRuJ3QgcmVzcG9uZCB0byBxdWVzdGlvbnMgZnJv
bSBIZWlucmljaCB5ZXQuCgotLQpBbmF0b2xpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
