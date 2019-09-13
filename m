Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F0B1B34
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 11:53:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91168C349C8
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 09:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35F18C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 09:48:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8D9k27G018524; Fri, 13 Sep 2019 11:48:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=A4CKa3f5nWLE/pywiD9p3GIHrPMRV4CtmLCkqBvT++E=;
 b=tLWIfSot93K98E+8Zp8otRaM9VJzQsz9eUdaBm75E4A2ueMM1Sb6dmO2+PO21XBGkWYq
 LLjmQjcnzTdRsDXqnWyohImnzBaEFT5Em3EFbEXf/nbUPQRG+m/HlJ2jYHxxjBlUmH5C
 sa14Ft8P7g1BZ4Xn1x7CagR9fO4jeNd9btNu4ALupDAu7dW//lKOz5mkhhboQSywicoJ
 Vwp3l0JkXU8y3Mb72KWi7y+PvN+gI50HN4AQVLwqHjgNsIw1swfp9X3B/6DWlBusCqHE
 3W8SL0+epnVyZLfe1BVyRWwRaKQLzEA2ZNalfLi3NxQW8nh6V7cu68MWPvENOx2mxH2B 9g== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uytdx46c2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 11:48:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 11C3923;
 Fri, 13 Sep 2019 09:48:50 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D7392BB897;
 Fri, 13 Sep 2019 11:48:49 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 11:48:49 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 11:48:48
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Vikas Manocha <vikas.manocha@st.com>, Benjamin Gaignard
 <benjamin.gaignard@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Jens Wiklander <jens.wiklander@linaro.org>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
Date: Fri, 13 Sep 2019 11:48:01 +0200
Message-ID: <1568368083-11075-14-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_05:2019-09-11,2019-09-13 signatures=0
X-Mailman-Approved-At: Fri, 13 Sep 2019 09:53:41 +0000
Subject: [Uboot-stm32] [PATCH v4 13/15] ARM: dts: stm32mp1: add dsi host for
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
