Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 922329E165F
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 09:55:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 493DCC6C83D;
	Tue,  3 Dec 2024 08:55:26 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24CE7C6B47E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 08:55:19 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37eOSI001826;
 Tue, 3 Dec 2024 09:55:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3dbxFJuBb/rEd8lOyAnTuwc63Q98rA7QH7SGSjAJo44=; b=uoblUOGx1V0Rna7a
 T5Zo4y/C6xPhnPWnhCZjFA7j48zsTReU4i8G/iYmXjW69IxM3fxgM/Px3+59QY15
 sVsBccb9U+gGX5LVQV8rDcjK2j9KWJkXbfBpo6eYb1Aqd2IX1+F+CCs15sLFyUsz
 p+00NDyzBRCoUmqwqNcYozSS6CM4k+iHsntvh27pWwGDhbTbNtbuhO3ZewImcAE5
 0Qjfx0H7T6APA1rbwDuivCKhCI8ivACIRfdJNfxHqAByJbN4cdjQB4whNPk2ugXW
 oLDa6HP88yuDJrZyZrBjmKWj4burUFUGaKC4VPWKw4ReZyOwRz0/TDPcLnyPvfBN
 k4Gk3w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 438ehns6cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 09:55:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 06BC340053;
 Tue,  3 Dec 2024 09:54:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48E0A267CB9;
 Tue,  3 Dec 2024 09:53:36 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 3 Dec
 2024 09:53:35 +0100
Message-ID: <0ea488b2-d76f-450e-84c1-d43fe8f08e33@foss.st.com>
Date: Tue, 3 Dec 2024 09:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241202074644.5380-1-patrice.chotard@foss.st.com>
 <7e22db87-96bd-4046-b08b-070e8be00624@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7e22db87-96bd-4046-b08b-070e8be00624@denx.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: gadget: f_mass_storage: Add
 schedule() in sleep_thread()
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



On 12/3/24 02:02, Marek Vasut wrote:
> On 12/2/24 8:46 AM, Patrice Chotard wrote:
>> In case "ums" command is used on platforms which don't implement
>> g_dnl_board_usb_cable_connected() and USB cable is not connected,
>> we stay inside sleep_thread() forever and watchdog is triggered.
>>
>> Add schedule() call to avoid this issue.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> 
> Is this a bugfix for 2025.01 ?

No, it can wait next release v2025.04

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
