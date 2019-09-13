Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C93B1B36
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 11:53:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D53FC32EA0
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 09:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEDEDC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 09:49:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8D9k3tM018527; Fri, 13 Sep 2019 11:48:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=NdaQmccc3bot0vDh/sW+RTGCFeMKWt2yxLT39mQsMG4=;
 b=xq6Erp8oHCbC9IV5p2xS1VXljyUbe4Eqh1aOyE3DHjmO2sREy/dGfzaD8u+DJYJrYZ+p
 +PrT1M0SdEQNo3tiPMcdzgHvFaAiw306z/5a7IGJKnA163BtGCvgqDBFfhxikv80S7Ft
 hvGNKN3gJjm/wI+hewtOwVvt5X5pAt07yOJX7SvGraE1p8kOw6gWT0BTE8tJBVrSjETj
 6pUwxpqGQfEci90dJpg7QgHx0VE20xgI0MXOdKXzcNpOaBj6vtHM3BS1Xiplp+tWrg12
 9wRY6NjLAFQmM8PuLIgcX7ALex3DDYOdJjk+0sWHSR/tLMAIPrO/8zZWZHbIQAYS8GW/ TQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uytdx46ca-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 11:48:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7810256;
 Fri, 13 Sep 2019 09:48:51 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2B272BB897;
 Fri, 13 Sep 2019 11:48:50 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 11:48:50 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 11:48:50
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
Date: Fri, 13 Sep 2019 11:48:02 +0200
Message-ID: <1568368083-11075-15-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_05:2019-09-11,2019-09-13 signatures=0
X-Mailman-Approved-At: Fri, 13 Sep 2019 09:53:41 +0000
Subject: [Uboot-stm32] [PATCH v4 14/15] stm32mp1: configs: update video
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

VXBkYXRlIHZpZGVvIGNvbmZpZ3MgdG8gc3VwcG9ydCBiaXRtYXAgMTZicHAsIDI0YnBwLAozMmJw
cCAmIFJMRTguCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJl
QHN0LmNvbT4KLS0tCiBpbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDEuaCB8IDcgKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvY29uZmln
cy9zdG0zMm1wMS5oIGIvaW5jbHVkZS9jb25maWdzL3N0bTMybXAxLmgKaW5kZXggOTI2NjBmZS4u
OTg4OTkyYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9jb25maWdzL3N0bTMybXAxLmgKKysrIGIvaW5j
bHVkZS9jb25maWdzL3N0bTMybXAxLmgKQEAgLTgzLDYgKzgzLDEzIEBACiAjZGVmaW5lIENPTkZJ
R19TWVNfTVREUEFSVFNfUlVOVElNRQogI2VuZGlmCiAKKyNpZmRlZiBDT05GSUdfRE1fVklERU8K
KyNkZWZpbmUgQ09ORklHX1ZJREVPX0JNUF9STEU4CisjZGVmaW5lIENPTkZJR19CTVBfMTZCUFAK
KyNkZWZpbmUgQ09ORklHX0JNUF8yNEJQUAorI2RlZmluZSBDT05GSUdfQk1QXzMyQlBQCisjZW5k
aWYKKwogLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqLwogI2lmZGVmIENPTkZJR19ESVNUUk9fREVGQVVM
VFMKIC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKi8KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
