Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AC042085C
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Oct 2021 11:35:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1091C5AB6F;
	Mon,  4 Oct 2021 09:35:21 +0000 (UTC)
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
 [67.231.157.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97781C57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 09:35:20 +0000 (UTC)
Received: from pps.filterd (m0048204.ppops.net [127.0.0.1])
 by m0048204.ppops.net-00176a03. (8.16.1.2/8.16.1.2) with SMTP id
 19440HMa006430
 for <uboot-stm32@st-md-mailman.stormreply.com>; Mon, 4 Oct 2021 05:35:19 -0400
Date: Mon, 4 Oct 2021 12:35:14 +0300
From: Ian Ray <ian.ray@ge.com>
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Message-ID: <20211004093514.GA19525@zoo6.em.health.ge.com>
References: <20211004112322.1.Ibee20141b9082ea184cc316944070e647a60fc92@changeid>
 <d3ca34b4c49eb8d4@bloch.sibelius.xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3ca34b4c49eb8d4@bloch.sibelius.xs4all.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 6Wa27NVIAFXoS6HZMfXF777mqBSBLVvy
X-Proofpoint-ORIG-GUID: 6Wa27NVIAFXoS6HZMfXF777mqBSBLVvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_02,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 clxscore=1011 mlxlogscore=941 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040065
Cc: marex@denx.de, oleksandr.suvorov@toradex.com, mbrugger@suse.com,
 sebastian.reichel@collabora.com, sjg@chromium.org, lukma@denx.de,
 rick@andestech.com, jh80.chung@samsung.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, a-govindraju@ti.com,
 jagan@amarulasolutions.com, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 seanga2@gmail.com
Subject: Re: [Uboot-stm32] EXT: Re: [PATCH] configs: Move some usb config in
	defconfig
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

On Mon, Oct 04, 2021 at 11:33:45AM +0200, Mark Kettenis wrote:
> 
> > From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > Date: Mon, 4 Oct 2021 11:23:41 +0200
> > 
> > Using the tools moveconfig.py to move the following config in the
> > defconfig files:
> >  CONFIG_USB_HOST_ETHER
> >  CONFIG_USB_ETHER_ASIX
> >  CONFIG_USB_ETHER_MCS7830
> >  CONFIG_USB_ETHER_SMSC95XX
> > 
> > These option are already migrated since the commit f58ad98a621c ("usb: net:
> > migrate USB Ethernet adapters to Kconfig") and the commit ae3584498bf8
> > ("usb: net: migrate CONFIG_USB_HOST_ETHER to Kconfig").
> > 
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > ---
> > 
> >  configs/dh_imx6_defconfig       | 2 ++
> >  configs/kp_imx6q_tpc_defconfig  | 2 ++
> >  configs/mx53ppd_defconfig       | 4 ++++
> >  configs/stih410-b2260_defconfig | 4 ++++
> >  include/configs/dh_imx6.h       | 2 --
> >  include/configs/kp_imx6q_tpc.h  | 2 --
> >  include/configs/mx53ppd.h       | 4 ----
> >  include/configs/stih410-b2260.h | 5 -----
> >  8 files changed, 12 insertions(+), 13 deletions(-)
> 
> Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
> 

Reviewed-by: Ian Ray <ian.ray@ge.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
