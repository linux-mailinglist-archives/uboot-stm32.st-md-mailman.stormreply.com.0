Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EE370029
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 14:50:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1704CD24E7
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 12:50:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7721CD24E6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 12:50:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MCQwRg020477; Mon, 22 Jul 2019 14:50:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=UtkBvUwT3tJ99/xnNsV/criPX5tyYBCvh576aT850Es=;
 b=dT/ho68VF0/XElSCHAgzLZyDaq5gw9BKX4spcE3mbL8Mfq96QyyaY6ZwxvS3CRCAhbTd
 rMKYXjsyW3xuOzL4/FciY8zM6aaF+MuCq978KVFdpvVtZHmu7f/x/sTKIo96hTuVtSW3
 cNAvKYmPjUzZc4Ct7KcZ35QxpdjVpM2+0rJqfnvTJnd7NP0Me42zfnot0uvOuOfR+UU6
 wmwPo7YwxO8Cdba85ui8VDs6nmbKAhS+RV1CvbaAllWDAGSFlmfpobg+5jjfMkZ0/SqA
 vPlTwOFwY/4XCjl6vMnVcBC5ouSR+dVHWgyq/cFW+nmVeE2Dp2GaplI/SuvyCWDq8OXu nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ture1bpsj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 14:50:29 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED4D134;
 Mon, 22 Jul 2019 12:50:28 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C507F2D54;
 Mon, 22 Jul 2019 12:50:28 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul
 2019 14:50:28 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul 2019 14:50:28
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 22 Jul 2019 14:50:21 +0200
Message-ID: <1563799821-25922-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_10:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] rtc: stm32: manage 2 digit limitation on year
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

STM32 RTC manages only 2 digits for YEAR
(Year tens and units in BCD format in RTC_DR register).

With this patch, RTC driver assumes that tm->tm_years is between
2000 and 2099; tm->tm_year - 2000 have only 2 digit
(0 > and <= 99).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/rtc/stm32_rtc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/stm32_rtc.c b/drivers/rtc/stm32_rtc.c
index abd3390..2674714 100644
--- a/drivers/rtc/stm32_rtc.c
+++ b/drivers/rtc/stm32_rtc.c
@@ -72,7 +72,8 @@ static int stm32_rtc_get(struct udevice *dev, struct rtc_time *tm)
 
 	tm->tm_mday = bcd2bin((dr & STM32_RTC_DATE) >> STM32_RTC_DATE_SHIFT);
 	tm->tm_mon = bcd2bin((dr & STM32_RTC_MONTH) >> STM32_RTC_MONTH_SHIFT);
-	tm->tm_year = bcd2bin((dr & STM32_RTC_YEAR) >> STM32_RTC_YEAR_SHIFT);
+	tm->tm_year = 2000 +
+		      bcd2bin((dr & STM32_RTC_YEAR) >> STM32_RTC_YEAR_SHIFT);
 	tm->tm_wday = bcd2bin((dr & STM32_RTC_WDAY) >> STM32_RTC_WDAY_SHIFT);
 	tm->tm_yday = 0;
 	tm->tm_isdst = 0;
@@ -174,6 +175,9 @@ static int stm32_rtc_set(struct udevice *dev, const struct rtc_time *tm)
 		tm->tm_year, tm->tm_mon, tm->tm_mday, tm->tm_wday,
 		tm->tm_hour, tm->tm_min, tm->tm_sec);
 
+	if (tm->tm_year < 2000 || tm->tm_year > 2099)
+		return -EINVAL;
+
 	/* Time in BCD format */
 	t = (bin2bcd(tm->tm_sec) << STM32_RTC_SEC_SHIFT) & STM32_RTC_SEC;
 	t |= (bin2bcd(tm->tm_min) << STM32_RTC_MIN_SHIFT) & STM32_RTC_MIN;
@@ -182,7 +186,8 @@ static int stm32_rtc_set(struct udevice *dev, const struct rtc_time *tm)
 	/* Date in BCD format */
 	d = (bin2bcd(tm->tm_mday) << STM32_RTC_DATE_SHIFT) & STM32_RTC_DATE;
 	d |= (bin2bcd(tm->tm_mon) << STM32_RTC_MONTH_SHIFT) & STM32_RTC_MONTH;
-	d |= (bin2bcd(tm->tm_year) << STM32_RTC_YEAR_SHIFT) & STM32_RTC_YEAR;
+	d |= (bin2bcd(tm->tm_year - 2000) << STM32_RTC_YEAR_SHIFT) &
+	      STM32_RTC_YEAR;
 	d |= (bin2bcd(tm->tm_wday) << STM32_RTC_WDAY_SHIFT) & STM32_RTC_WDAY;
 
 	return stm32_rtc_set_time(dev, t, d);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
