Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E2E326322
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 14:09:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02B25C57189;
	Fri, 26 Feb 2021 13:09:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0756C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 13:09:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QD7bTx004385; Fri, 26 Feb 2021 14:09:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=s6dKr9NtjWT77cakDNEykxZw1GeLDSmBJQGnlBZm7o4=;
 b=YBt2cQrGFJ1yryNfNqBZzKwMHVPVnY7qqRX63vbCBVmS+sEj9oNJtMqqmemiIxC02dFt
 G9KWH4/+2ivY9lfkkTYusNsN9MIVIfZJMm0cpdgeP2lxY6j6w+smcfobMD9p+wtHSuAY
 U5ZiT/fWw16AH/9oDLkQbK6s85HF/kfLjFF5myfqR+l2qkxDe64Vmu+fkegV6RMXumX3
 3bPrT+X+RH6f8OYDiYCMh0rMuyrh7foTKn1xyZUX+Na+vvFj3O/eOxVMzX5ePub2C0Tm
 x5vLkoW3q7XCUvCc7o1SgVwliAr4/OlKc5GiGZQPghF5DXEy8ThTYZ0nTJUgw1Xhcl6S gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66ydjmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 14:09:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3C0D10002A;
 Fri, 26 Feb 2021 14:09:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 962D4236866;
 Fri, 26 Feb 2021 14:09:42 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 14:09:41 +0100
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20210226125251.2150584-1-ilias.apalodimas@linaro.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <b60c1a10-ef77-7a20-a70b-8bf1a5b68dfa@foss.st.com>
Date: Fri, 26 Feb 2021 14:09:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226125251.2150584-1-ilias.apalodimas@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_03:2021-02-24,
 2021-02-26 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH v2] configs: stm32mp1: enable uefi related
	commands
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 2/26/21 1:52 PM, Ilias Apalodimas wrote:
> The board can boot with UEFI. With the latest changes in U-Boot's
> EFI subsystem we also have support for EFI runtime variables, without
> SetVariable support.  We can also store the EFI variables in a file on the
> ESP partition and preserve them across reboots.
> The env and efidebug commands are missing in order to configure
> EFI variables and the efibootmgr though.  Since U-Boot's default config
> enables other EFI related commands (e.g bootefi), let's add the env related
> and efidebug commands and allow users to do that
>
> Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> ---
> Changes since v1:
> - Apply identical changes on stm32mp15_basic_defconfig
>   configs/stm32mp15_basic_defconfig   | 3 +++
>   configs/stm32mp15_trusted_defconfig | 3 +++
>   2 files changed, 6 insertions(+)
>
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
