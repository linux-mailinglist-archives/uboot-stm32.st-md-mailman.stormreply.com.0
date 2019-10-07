Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E5CE3B5
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 15:29:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1C70C36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 13:29:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF647C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 13:29:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97DKpKf011728; Mon, 7 Oct 2019 15:29:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=A4CKa3f5nWLE/pywiD9p3GIHrPMRV4CtmLCkqBvT++E=;
 b=chZVI8omxZrZjYMht8KIdFYcT3hImra4OEw9MxWvFsQVD5L6UGmjdgKi279ofNKLttBC
 ktCX85nmkM179eGpijMrBgcpbEUxzBAKk1wNAUkmgzCFioT97p0autaTTr5X4/Y0DdMJ
 9q1dvgvNLh4XtWBoQYS4LrMs4xVsecxIWcMsCh/+assVMS4weJLnKQYTT3JJaFnt/h00
 QToD3zgGHtDcSX6NU/CXt0xZ+sqee3ZmaM2QU2tv2Xg79t0b0X07CCh3fcYurSAIn9Ua
 6ccV2l2wh/wsi89mYy/ntbBEFrahevIcmFMdpZ4AuSJPYx8isbZlXeVkB4BmOFYiTUC7 kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2p2jky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 15:29:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F277C100034;
 Mon,  7 Oct 2019 15:29:45 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6A9B2BFE0F;
 Mon,  7 Oct 2019 15:29:45 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019
 15:29:45 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019 15:29:45
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Vikas Manocha <vikas.manocha@st.com>, Benjamin Gaignard
 <benjamin.gaignard@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Jens Wiklander <jens.wiklander@linaro.org>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
Date: Mon, 7 Oct 2019 15:29:13 +0200
Message-ID: <1570454955-21298-14-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Subject: [Uboot-stm32] [PATCH v5 13/15] ARM: dts: stm32mp1: add dsi host for
	stm32mp157c-dk2 board
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

VGhlIG5ldyBjbGFzcyBkc2kgaG9zdCBhbGxvd3MgdGhlIG1hbmFnZW1lbnQgb2YgdGhlIGJyaWRn
ZSBEUEkgdG8gRFNJLgpUaGlzIGJyaWRnZSBpcyBlbWJlZGRlZCBpbiB0aGUgY2hpcHNldCBtcDEg
KGNvbWUgZnJvbSBzeW5vcHN5cyBjb21wYW55KS4KClNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVy
dHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3
Yy1kazItdS1ib290LmR0c2kgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZGsyLXUtYm9vdC5k
dHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWRrMi11LWJvb3QuZHRzaQppbmRleCAxOGFj
MWUzLi5jZDk5NDdmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZGsyLXUt
Ym9vdC5kdHNpCisrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1kazItdS1ib290LmR0c2kK
QEAgLTUsNiArNSwxMyBAQAogCiAjaW5jbHVkZSAic3RtMzJtcDE1N2EtZGsxLXUtYm9vdC5kdHNp
IgogCisvIHsKKwlkc2lfaG9zdDogZHNpX2hvc3QgeworCQljb21wYXRpYmxlID0gInN5bm9wc3lz
LGR3LW1pcGktZHNpIjsKKwkJc3RhdHVzID0gIm9rYXkiOworCX07Cit9OworCiAmaTJjMSB7CiAJ
aGRtaS10cmFuc21pdHRlckAzOSB7CiAJCXJlc2V0LWdwaW9zID0gPCZncGlvYSAxMCBHUElPX0FD
VElWRV9MT1c+OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
