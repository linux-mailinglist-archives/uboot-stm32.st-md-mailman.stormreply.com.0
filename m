Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AEA294C90
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:27:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 201D6C3FAE0;
	Wed, 21 Oct 2020 12:27:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8364C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:27:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LC85Z1023367; Wed, 21 Oct 2020 14:27:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ACmmuO+Cmmxw7UQ1/hIokuU7fbzfVDoFqr4tMK8xLS0=;
 b=rUL95MV7rGHf7uSg3KKGtaAN0gCV5E6EIOiktF9Olq4WsX3CHhX78sOHC2V0gbsNPTws
 ootW8l83HfMi97ycsJYsI4Uvk5MzKuaOvQSv7u3lM/PfzxuZpoxhJeSqQ4TDyFp6+UeS
 KNGInkgSBMx+mbjFmxOIOQzDMvvwIJsx38UJfHp5YnaMDCGQY7Qq1Q/qSNTbaYeqOU3R
 boa/B1mpcdLSRwiwTvd+PK1in/U1Cnkj7i8t6QQKPbEjkIy+gnyC46j8VmGNfDxtCnQh
 +5D7OurFIcbH6v4LWggGiZhjYD05CjOBnLSQFr6fJFuMua1HWpbqfuBiRsFqIMsViFIc Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx1yn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:27:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CCE54100034;
 Wed, 21 Oct 2020 14:27:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C38062D541B;
 Wed, 21 Oct 2020 14:27:36 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:27:36 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:27:36 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 14/33] power: regulator: stm32-verfbuf: define
 LOG_CATEGORY
Thread-Index: AQHWogrGZyekrj1knEe+hVK1R0U26Kmh5X2A
Date: Wed, 21 Oct 2020 12:27:36 +0000
Message-ID: <957e5cda-2c37-6c8f-917a-a3135d75aa90@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-15-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-15-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <2D535900943FCC4D8657BCB77E261465@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 14/33] power: regulator: stm32-verfbuf:
 define LOG_CATEGORY
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

Hi Patrick

On 10/14/20 11:16 AM, Patrick Delaunay wrote:
> Define LOG_CATEGORY to allow filtering with log command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/power/regulator/stm32-vrefbuf.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/power/regulator/stm32-vrefbuf.c b/drivers/power/regulator/stm32-vrefbuf.c
> index 92136961c2..556579709d 100644
> --- a/drivers/power/regulator/stm32-vrefbuf.c
> +++ b/drivers/power/regulator/stm32-vrefbuf.c
> @@ -6,6 +6,8 @@
>   * Originally based on the Linux kernel v4.16 drivers/regulator/stm32-vrefbuf.c
>   */
>  
> +#define LOG_CATEGORY UCLASS_REGULATOR
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <dm.h>

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
