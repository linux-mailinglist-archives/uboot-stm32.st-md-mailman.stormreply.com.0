Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5271D2BA0
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 11:40:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB876C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 09:40:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A031CC36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:40:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E9cQg2023695; Thu, 14 May 2020 11:39:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ip7WI2QpAbXhZ3Mv0Re0fakoZnq6JZCcvc/vLfFt1pg=;
 b=BrIcRDVxYOiVCtpD2BnkrIm/JgonTdzgc1SiEy2IBXAILDZUejAghFWAwYARTKGXhKxc
 KV69p8il+TF/PjXXBqN63aIenYqGQv6RhYAJiZrUiPDXjGPwaYepO7jqPnzXEBz9JUGN
 r1611WJ/LZ+4YGi3go5V5Vb9jjj7r1cimvzLwGE9yHo5GMC/aWBS8fa+lzAVWterLxDZ
 CPNs9RCTBUnoC8ik5JOtjwNh2sIOlhGFs3C2tQA/EGTZlJbIEcW6cuoJFL5wrYIGRs13
 JRv+Ba4eAwWZ8NTPSyXLf1vx8Zxz9BNcGJGX1YOHRVqWdHWSCxo8ZvYNoFaden+AEXh5 Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vpj9pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:39:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 216DF10002A;
 Thu, 14 May 2020 11:39:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1350B2AF977;
 Thu, 14 May 2020 11:39:58 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 May
 2020 11:39:57 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 11:39:57 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v4 2/2] arm: stm32mp: activate data cache on DDR in SPL
Thread-Index: AQHWHvvj3YqmKqpZL0CzWQ04i256fainaTNw
Date: Thu, 14 May 2020 09:39:57 +0000
Message-ID: <5b1f4f8c0b774a759b4b92be183078ce@SFHDAG6NODE3.st.com>
References: <20200430143021.3636-1-patrick.delaunay@st.com>
 <20200430163010.v4.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
In-Reply-To: <20200430163010.v4.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v4 2/2] arm: stm32mp: activate data cache
	on DDR in SPL
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

Hi

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: jeudi 30 avril 2020 16:30
> 
> Activate cache on DDR to improve the accesses to DDR used by SPL:
> - CONFIG_SPL_BSS_START_ADDR
> - CONFIG_SYS_SPL_MALLOC_START
> 
> Cache is configured only when DDR is fully initialized, to avoid speculative access
> and issue in get_ram_size().
> Data cache is deactivated at the end of SPL, to flush the data cache and the TLB.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v4:
> - fix commit message and add Patrice Chotard reviewed-by
> 
> Changes in v3:
> - remove debug message "bye"
> 
> Changes in v2:
> - new
> 
>  arch/arm/mach-stm32mp/spl.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
