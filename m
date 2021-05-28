Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 429FB39561C
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 May 2021 09:30:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D87AEC57B5A;
	Mon, 31 May 2021 07:30:41 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9171C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 16:53:03 +0000 (UTC)
Received: from [192.168.192.146] (port=39190 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1lmfjH-0008AW-Is; Fri, 28 May 2021 18:52:59 +0200
Date: Fri, 28 May 2021 18:52:58 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <cover.1622220270.git.gszymaszek@short.pl>
Mail-Followup-To: u-boot@lists.denx.de,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 31 May 2021 07:30:40 +0000
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>
Subject: [Uboot-stm32] =?utf-8?q?=5BPATCH_0/5=5D_arm=3A_dts=3A_stm32mp157c?=
 =?utf-8?q?-odyssey-som=3A_sync_SDMMC2_with_Linux_and_TF=E2=80=91A?=
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

VGhpcyBwYXRjaHNldCB1cGRhdGVzIHRoZSBwcm9wZXJ0aWVzIG9mIHRoZSBTRE1NQzIgZGV2aWNl
IHRyZWUgbm9kZSBzbwp0aGF0IHRoZXkgbWF0Y2ggdGhlaXIgTGludXgga2VybmVsIGFuZCBUcnVz
dGVkIEZpcm13YXJlIEEgY291bnRlcnBhcnRzLgpUd28gZGlmZmVyZW5jZXMgd2lsbCByZW1haW46
CuKAlCBpbiB0aGUgTGludXgga2VybmVsIGRldmljZSB0cmVlLCB0aGUgVlFNTUMgc3VwcGx5IGlz
IGluY29ycmVjdGx5IHNldAogIHRvIHYzdjMgKGJ1Y2s0KSBpbnN0ZWFkIG9mIHZkZCAoYnVjazMp
OwrigJQgaW4gdGhlIFRG4oCRQSBkZXZpY2UgdHJlZSwgb25seSB0aGUg4oCcZGVmYXVsdOKAnSBw
aW5jdHJsIGlzIGNvbmZpZ3VyZWQuCgpBZGRpdGlvbmFsbHksIHRoaXMgcGF0Y2hzZXQgZW5hYmxl
cyBTRE1NQzIgaW4gU1BMLgoKR3J6ZWdvcnogU3p5bWFzemVrICg1KToKICBhcm06IGR0czogc3Rt
MzJtcDE1N2Mtb2R5c3NleS1zb206IGZpeCB0aGUgYmFzaWMgU0RNTUMyIHByb3BlcnRpZXMKICBh
cm06IGR0czogc3RtMzJtcDE1N2Mtb2R5c3NleS1zb206IGVuYWJsZSBhbGwgU0RNTUMyIGRhdGEg
bGFuZXMKICBhcm06IGR0czogc3RtMzJtcDE1N2Mtb2R5c3NleS1zb206IHNldCB0aGUgU0RNTUMy
IFZRTU1DIHN1cHBseQogIGFybTogZHRzOiBzdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbTogZW5hYmxl
IHRoZSBTRE1NQzIgZU1NQyBIUyBERFIgbW9kZQogIGFybTogZHRzOiBzdG0zMm1wMTU3Yy1vZHlz
c2V5LXNvbTogZW5hYmxlIFNETU1DMiBpbiBTUEwKCiAuLi4vZHRzL3N0bTMybXAxNTdjLW9keXNz
ZXktc29tLXUtYm9vdC5kdHNpICAgfCAyMSArKysrKysrKysrKysrKysrKysrCiBhcmNoL2FybS9k
dHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaSAgICAgfCAxNSArKysrKysrLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgotLSAKMi4z
MC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
