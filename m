Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D95B1B35
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 11:53:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97311CFAC57
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 09:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7AC0C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 09:48:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8D9jkcc018702; Fri, 13 Sep 2019 11:48:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=yr4+01hvdLzh3oXyq/6gHkIO7dSdGQeMYJpl1c4BuDA=;
 b=BEW+xSXycP3ImaLQ63BsK9vfM4PzSc8rAdtDfgLhsdIe6m9ckPi/VdrJxKPRq0BHMQ4w
 SYEGnZ6XaAxYSlYtmKbgjjiCTVjYqisZTsLIA+SkRJ0Y8w0jrwz6zf80XRh+H191cSL2
 btxSrYevakq0HXAOtHD6nqQUwjreWwsJPlKtmmf8olvD2GqUHYSt2oWpjaaKBgZTor3o
 nH89DP73b7MNlbXzKbDpeOBDTokOQLlbFnYkO6ECQx73q2N45KTdGSbpkfTTbpsmvwks
 7xwOdfy0rPwUKthYV2O3yz1eiWCKt6xBg7gKlY439OSPoIlJwwQyAQdtQf1MwxmQVFKp Fg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uyte3v550-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 11:48:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E89B64B;
 Fri, 13 Sep 2019 09:48:47 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A39712BB898;
 Fri, 13 Sep 2019 11:48:47 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 11:48:47 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 11:48:47
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
Date: Fri, 13 Sep 2019 11:48:00 +0200
Message-ID: <1568368083-11075-13-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_05:2019-09-11,2019-09-13 signatures=0
X-Mailman-Approved-At: Fri, 13 Sep 2019 09:53:41 +0000
Subject: [Uboot-stm32] [PATCH v4 12/15] ARM: dts: stm32mp1: add dsi host for
	stm32mp157c-ev1 board
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
Yy1ldjEtdS1ib290LmR0c2kgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2MS11LWJvb3QuZHRz
aSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEtdS1ib290LmR0c2kKaW5kZXggZWM2MDQ4
Ni4uYWY1OTQ1ZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2MS11LWJv
b3QuZHRzaQorKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLXUtYm9vdC5kdHNpCkBA
IC0xNCw2ICsxNCwxMSBAQAogCQlzcGkwID0gJnFzcGk7CiAJCXVzYjAgPSAmdXNib3RnX2hzOwog
CX07CisKKwlkc2lfaG9zdDogZHNpX2hvc3QgeworCQljb21wYXRpYmxlID0gInN5bm9wc3lzLGR3
LW1pcGktZHNpIjsKKwkJc3RhdHVzID0gIm9rYXkiOworCX07CiB9OwogCiAmZmxhc2gwIHsKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpV
Ym9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby91Ym9vdC1zdG0zMgo=
