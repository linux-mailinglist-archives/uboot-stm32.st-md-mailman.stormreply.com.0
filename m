Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0115323C4A
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 13:53:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B217EC57B53;
	Wed, 24 Feb 2021 12:53:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4462FC3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 12:53:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OCf8fK030356; Wed, 24 Feb 2021 13:53:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=z7IRu3FVT3dUOAWcSB6X+RdpCcxy6KDNt4R5dod29nc=;
 b=a3kg8LM2DccQ1AOzvv/UhVRWR8zvL/J51eRZUjH/LewGGEH1RdQqrQbgjuZ+Mo19cNQG
 es+S2kCThUXIrDTa2Bh3FDx8lf6PztDd50MjdZu0ZFzksKGU0NPqQ1ENmqF88xYc+oCj
 WduBk6iPKtbup0iGkmkG7kkISopNoLlVhCjZzj85Z5mXNhGTikcxY7ZMg/Lr8KbnRbg8
 xhnsCH1A9sbT9Zpvu7MmFUh2ovde5WaMbyuUySCvkyRUgJYoko2eQg+WpbecBvPOUSgK
 OdMUDwdtoLRopiX9VzwbhjsMqBdB7tKw1ttsTWoy7FNKMXRBSpZVgKKKj1i2AQZvTTMa QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66ce9tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 13:53:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56A4510002A;
 Wed, 24 Feb 2021 13:53:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48A6E22D61E;
 Wed, 24 Feb 2021 13:53:50 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 13:53:49
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 13:53:27 +0100
Message-ID: <20210224125327.21937-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_04:2021-02-24,
 2021-02-24 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: Fix compilation issue when
	SYS_DCACHE_OFF and/or SYS_DCACHE_SYS are enabled
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

RnJvbTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPgoKRml4IGZvbGxv
d2luZyBjb21waWxhdGlvbiBpc3N1ZSB3aGVuIFNZU19EQ0FDSEVfT0ZGIGFuZC9vciBTWVNfRENB
Q0hFX1NZUwphcmUgZW5hYmxlZCA6CgphcmNoL2FybS9tYWNoLXN0bTMybXAvY3B1LmM6IEluIGZ1
bmN0aW9uIOKAmGVhcmx5X2VuYWJsZV9jYWNoZXPigJk6CmFyY2gvYXJtL21hY2gtc3RtMzJtcC9j
cHUuYzoyMjM6MTA6IGVycm9yOiDigJh2b2xhdGlsZSBzdHJ1Y3QgYXJjaF9nbG9iYWxfZGF0YeKA
mSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmHRsYl9zaXpl4oCZCiAgMjIzIHwgIGdkLT5hcmNoLnRs
Yl9zaXplID0gUEdUQUJMRV9TSVpFOwogICAgICB8ICAgICAgICAgIF4KYXJjaC9hcm0vbWFjaC1z
dG0zMm1wL2NwdS5jOjIyNDoxMDogZXJyb3I6IOKAmHZvbGF0aWxlIHN0cnVjdCBhcmNoX2dsb2Jh
bF9kYXRh4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYdGxiX2FkZHLigJkKICAyMjQgfCAgZ2Qt
PmFyY2gudGxiX2FkZHIgPSAodW5zaWduZWQgbG9uZykmZWFybHlfdGxiOwogICAgICB8ICAgICAg
ICAgIF4KClNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0
LmNvbT4KU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9z
cy5zdC5jb20+Ci0tLQoKIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9jcHUuYyB8IDYgKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9jcHUuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9j
cHUuYwppbmRleCAzZmFhNGVjMThhLi5jZDUwM2I3Mjk0IDEwMDY0NAotLS0gYS9hcmNoL2FybS9t
YWNoLXN0bTMybXAvY3B1LmMKKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NwdS5jCkBAIC0y
MjMsOCArMjIzLDEwIEBAIHN0YXRpYyB2b2lkIGVhcmx5X2VuYWJsZV9jYWNoZXModm9pZCkKIAlp
ZiAoQ09ORklHX0lTX0VOQUJMRUQoU1lTX0RDQUNIRV9PRkYpKQogCQlyZXR1cm47CiAKLQlnZC0+
YXJjaC50bGJfc2l6ZSA9IFBHVEFCTEVfU0laRTsKLQlnZC0+YXJjaC50bGJfYWRkciA9ICh1bnNp
Z25lZCBsb25nKSZlYXJseV90bGI7CisJaWYgKCEoQ09ORklHX0lTX0VOQUJMRUQoU1lTX0lDQUNI
RV9PRkYpICYmIENPTkZJR19JU19FTkFCTEVEKFNZU19EQ0FDSEVfT0ZGKSkpIHsKKwkJZ2QtPmFy
Y2gudGxiX3NpemUgPSBQR1RBQkxFX1NJWkU7CisJCWdkLT5hcmNoLnRsYl9hZGRyID0gKHVuc2ln
bmVkIGxvbmcpJmVhcmx5X3RsYjsKKwl9CiAKIAlkY2FjaGVfZW5hYmxlKCk7CiAKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
