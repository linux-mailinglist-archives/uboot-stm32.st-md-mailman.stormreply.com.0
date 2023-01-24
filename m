Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 787F76794DA
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Jan 2023 11:13:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24665C65E71;
	Tue, 24 Jan 2023 10:13:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA6DEC03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 10:13:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30O4stc0005517; Tue, 24 Jan 2023 11:13:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pClCtRTUQRW3c2LHzhjj1D1yNLbwICh6YxiXBbxm2PU=;
 b=Mq9MLrU9Azw9ZgF1+4OoORjTvbz+QSESr1m7s4SGXN7OSrUu2qG++tfvpeNnrjLjOvBZ
 50agKJ/u8U22r8GZROAxQKjuJlAIc8slKzJW/K98eYxwz+fVondebstNJvALEe204evj
 3gLMfjLMP0SGLKqclLAe5SRu4uX4mteQHvQMEkiDdUW74Tlv9+TT0Ub4KMAGQRvgCffH
 xa9RbwS76b48i9L3NktUmwB/UUUNgMha04zaJ39CP1SMAfluAsMjuGQDor7+4x7QLE/6
 Iy8QelpyOIYcoLY/GjPEJnEX555jk1ro0vVua+pO8wWud/51IMvycn8e9UFceTh0lK4L 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n89cgpwqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 11:13:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 964D3100034;
 Tue, 24 Jan 2023 11:13:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C0A1214D2B;
 Tue, 24 Jan 2023 11:13:06 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 24 Jan
 2023 11:13:06 +0100
Message-ID: <a3bae6c1-c5ca-47b6-0e98-5ca76bf6ebce@foss.st.com>
Date: Tue, 24 Jan 2023 11:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230124101552.1.I555d0afdd36cf310168699c9a8619720b69cee4a@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230124101552.1.I555d0afdd36cf310168699c9a8619720b69cee4a@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Dillon Min <dillon.minfei@gmail.com>, Vikas Manocha <vikas.manocha@st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] doc: add rst references to distro
 documentation in stm32mp1 board
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

On 1/24/23 10:16, Patrick Delaunay wrote:
> Use internal rst reference with :doc: to have a link to distro.rst page
> in the generated U-Boot documentation.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  doc/board/st/stm32mp1.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
> index 3f70634d2836..c0b1daa0418e 100644
> --- a/doc/board/st/stm32mp1.rst
> +++ b/doc/board/st/stm32mp1.rst
> @@ -478,7 +478,8 @@ or:
>    +-------+--------+---------+------------------------+------------------------+
>  
>  And the 4th partition (Rootfs) is marked bootable with a file extlinux.conf
> -following the Generic Distribution feature (doc/develop/distro.rst for use).
> +following the Generic Distribution feature (see :doc:`../../develop/distro` for
> +use).
>  
>  The size of fip or ssbl partition must be enough for the associated binary file,
>  4MB and 2MB are default values.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
