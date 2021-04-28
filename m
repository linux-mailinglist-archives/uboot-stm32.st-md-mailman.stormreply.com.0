Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B996F36D5DF
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Apr 2021 12:39:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D08AC57B75;
	Wed, 28 Apr 2021 10:39:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBC45C57B74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Apr 2021 10:39:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SAX2WU024606; Wed, 28 Apr 2021 12:39:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=iKGGO5+Z3kf6ZxJoVZ00POoKzcu2UwqUfPFZmp7QZ60=;
 b=ZsblEz8DIUFpbSBpW9ZQ+erm2jwa7BOnBUr9PSw2knGiMesinbPf67vYsVbL8KZvKQr7
 GlHZWMMcTmcEy7z5TJxmZiZChfYt0h1lU8QMx9q4E6Vcn/64PNTnJYybk9tyDDFVMZBf
 l3t1YuWfbxuGsuf2zM0oHfBGl3ckQJ54UQj9RcFkORC815XQwOO0eqdZO9bAYRrcBib8
 /k/XbEarUY6/FTUjtUSz5KUnPpqnxIKwCqhBB4oSDR2gtlSbVHOI7deX9/6XifwTgrnI
 P6WXQT8S1Jc3fiHvhteq6j5EjQb02dAVDJLhtXXaWSC/2YV56+1hfoildTmH/zakCT5m zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38735whacv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 12:39:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1BD3D10002A;
 Wed, 28 Apr 2021 12:38:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F140B212276;
 Wed, 28 Apr 2021 12:38:58 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 12:38:58
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Apr 2021 12:38:39 +0200
Message-ID: <20210428123802.v2.1.I94f875f95a48be081d332f9a2c447c0b78955e75@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_04:2021-04-27,
 2021-04-28 signatures=0
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Etienne Carriere <etienne.carriere@linaro.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: [Uboot-stm32] [PATCH v2] dm: core: Add address translation in
	fdt_get_resource
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

Today of_address_to_resource() is called only in
ofnode_read_resource() for livetree support and
fdt_get_resource() is called when livetree is not supported.

The fdt_get_resource() doesn't do the address translation
so when it is required, but the address translation is done
by ofnode_read_resource() caller, for example in
drivers/firmware/scmi/smt.c::scmi_dt_get_smt_buffer() {
...
	ret = ofnode_read_resource(args.node, 0, &resource);
	if (ret)
		return ret;

	faddr = cpu_to_fdt32(resource.start);
	paddr = ofnode_translate_address(args.node, &faddr);
...

The both behavior should be aligned and the address translation
must be called in fdt_get_resource() and removed for each caller.

Fixes: a44810123f9e ("dm: core: Add dev_read_resource() to read device resources")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

This patch allows to remove the workaround in smci/smt.c
introduced by [1].

But it impact with all user of
- ofnode_read_resource
- ofnode_read_resource_byname
- dev_read_resource
- dev_read_resource_byname

After my first check, the only impacts are in drivers/net/mscc_eswitch
=> I remove the unnecessary translate after code review,
   this patch need to be verify on real hardware

I proposed to merge the workaround [1] as soon as possible to avoid issue
on stm32mp1 platform and this patch can be merged when it will be acked
by mscc_eswitch maintainers and other API users.

[1] "scmi: translate the resource only when livetree is not activated"
    http://patchwork.ozlabs.org/project/uboot/list/?series=236526&state=*


Changes in v2:
- remove translate in luton_switch.c:luton_probe()

 drivers/firmware/scmi/smt.c               | 12 +-----------
 drivers/net/mscc_eswitch/jr2_switch.c     |  4 +---
 drivers/net/mscc_eswitch/luton_switch.c   |  5 +----
 drivers/net/mscc_eswitch/ocelot_switch.c  |  4 +---
 drivers/net/mscc_eswitch/serval_switch.c  |  4 +---
 drivers/net/mscc_eswitch/servalt_switch.c |  4 +---
 lib/fdtdec.c                              |  6 +++++-
 7 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
index f1915c0074..e60c2aebc8 100644
--- a/drivers/firmware/scmi/smt.c
+++ b/drivers/firmware/scmi/smt.c
@@ -30,8 +30,6 @@ int scmi_dt_get_smt_buffer(struct udevice *dev, struct scmi_smt *smt)
 	int ret;
 	struct ofnode_phandle_args args;
 	struct resource resource;
-	fdt32_t faddr;
-	phys_addr_t paddr;
 
 	ret = dev_read_phandle_with_args(dev, "shmem", NULL, 0, 0, &args);
 	if (ret)
@@ -41,21 +39,13 @@ int scmi_dt_get_smt_buffer(struct udevice *dev, struct scmi_smt *smt)
 	if (ret)
 		return ret;
 
-	/* TEMP workaround for ofnode_read_resource translation issue */
-	if (of_live_active()) {
-		paddr = resource.start;
-	} else {
-		faddr = cpu_to_fdt32(resource.start);
-		paddr = ofnode_translate_address(args.node, &faddr);
-	}
-
 	smt->size = resource_size(&resource);
 	if (smt->size < sizeof(struct scmi_smt_header)) {
 		dev_err(dev, "Shared memory buffer too small\n");
 		return -EINVAL;
 	}
 
-	smt->buf = devm_ioremap(dev, paddr, smt->size);
+	smt->buf = devm_ioremap(dev, resource.start, smt->size);
 	if (!smt->buf)
 		return -ENOMEM;
 
diff --git a/drivers/net/mscc_eswitch/jr2_switch.c b/drivers/net/mscc_eswitch/jr2_switch.c
index 570d5a5109..d1e5b61ea5 100644
--- a/drivers/net/mscc_eswitch/jr2_switch.c
+++ b/drivers/net/mscc_eswitch/jr2_switch.c
@@ -863,7 +863,6 @@ static int jr2_probe(struct udevice *dev)
 	int i;
 	int ret;
 	struct resource res;
-	fdt32_t faddr;
 	phys_addr_t addr_base;
 	unsigned long addr_size;
 	ofnode eth_node, node, mdio_node;
@@ -926,9 +925,8 @@ static int jr2_probe(struct udevice *dev)
 
 		if (ofnode_read_resource(mdio_node, 0, &res))
 			return -ENOMEM;
-		faddr = cpu_to_fdt32(res.start);
 
-		addr_base = ofnode_translate_address(mdio_node, &faddr);
+		addr_base = res.start;
 		addr_size = res.end - res.start;
 
 		/* If the bus is new then create a new bus */
diff --git a/drivers/net/mscc_eswitch/luton_switch.c b/drivers/net/mscc_eswitch/luton_switch.c
index 54afa14c9d..73c950d118 100644
--- a/drivers/net/mscc_eswitch/luton_switch.c
+++ b/drivers/net/mscc_eswitch/luton_switch.c
@@ -588,7 +588,6 @@ static int luton_probe(struct udevice *dev)
 	struct luton_private *priv = dev_get_priv(dev);
 	int i, ret;
 	struct resource res;
-	fdt32_t faddr;
 	phys_addr_t addr_base;
 	unsigned long addr_size;
 	ofnode eth_node, node, mdio_node;
@@ -658,9 +657,7 @@ static int luton_probe(struct udevice *dev)
 
 		if (ofnode_read_resource(mdio_node, 0, &res))
 			return -ENOMEM;
-		faddr = cpu_to_fdt32(res.start);
-
-		addr_base = ofnode_translate_address(mdio_node, &faddr);
+		addr_base = res.start;
 		addr_size = res.end - res.start;
 
 		/* If the bus is new then create a new bus */
diff --git a/drivers/net/mscc_eswitch/ocelot_switch.c b/drivers/net/mscc_eswitch/ocelot_switch.c
index 19e725c6f9..d1d0a489ab 100644
--- a/drivers/net/mscc_eswitch/ocelot_switch.c
+++ b/drivers/net/mscc_eswitch/ocelot_switch.c
@@ -530,7 +530,6 @@ static int ocelot_probe(struct udevice *dev)
 	struct ocelot_private *priv = dev_get_priv(dev);
 	int i, ret;
 	struct resource res;
-	fdt32_t faddr;
 	phys_addr_t addr_base;
 	unsigned long addr_size;
 	ofnode eth_node, node, mdio_node;
@@ -578,9 +577,8 @@ static int ocelot_probe(struct udevice *dev)
 
 		if (ofnode_read_resource(mdio_node, 0, &res))
 			return -ENOMEM;
-		faddr = cpu_to_fdt32(res.start);
 
-		addr_base = ofnode_translate_address(mdio_node, &faddr);
+		addr_base = res.start;
 		addr_size = res.end - res.start;
 
 		/* If the bus is new then create a new bus */
diff --git a/drivers/net/mscc_eswitch/serval_switch.c b/drivers/net/mscc_eswitch/serval_switch.c
index 09ce33452d..c4b81f7529 100644
--- a/drivers/net/mscc_eswitch/serval_switch.c
+++ b/drivers/net/mscc_eswitch/serval_switch.c
@@ -482,7 +482,6 @@ static int serval_probe(struct udevice *dev)
 	struct serval_private *priv = dev_get_priv(dev);
 	int i, ret;
 	struct resource res;
-	fdt32_t faddr;
 	phys_addr_t addr_base;
 	unsigned long addr_size;
 	ofnode eth_node, node, mdio_node;
@@ -533,9 +532,8 @@ static int serval_probe(struct udevice *dev)
 
 		if (ofnode_read_resource(mdio_node, 0, &res))
 			return -ENOMEM;
-		faddr = cpu_to_fdt32(res.start);
 
-		addr_base = ofnode_translate_address(mdio_node, &faddr);
+		addr_base = res.start;
 		addr_size = res.end - res.start;
 
 		/* If the bus is new then create a new bus */
diff --git a/drivers/net/mscc_eswitch/servalt_switch.c b/drivers/net/mscc_eswitch/servalt_switch.c
index 4a4e9e4054..f114086ece 100644
--- a/drivers/net/mscc_eswitch/servalt_switch.c
+++ b/drivers/net/mscc_eswitch/servalt_switch.c
@@ -412,7 +412,6 @@ static int servalt_probe(struct udevice *dev)
 	struct servalt_private *priv = dev_get_priv(dev);
 	int i;
 	struct resource res;
-	fdt32_t faddr;
 	phys_addr_t addr_base;
 	unsigned long addr_size;
 	ofnode eth_node, node, mdio_node;
@@ -461,9 +460,8 @@ static int servalt_probe(struct udevice *dev)
 
 		if (ofnode_read_resource(mdio_node, 0, &res))
 			return -ENOMEM;
-		faddr = cpu_to_fdt32(res.start);
 
-		addr_base = ofnode_translate_address(mdio_node, &faddr);
+		addr_base = res.start;
 		addr_size = res.end - res.start;
 
 		/* If the bus is new then create a new bus */
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 864589193b..4b097fb588 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -942,7 +942,11 @@ int fdt_get_resource(const void *fdt, int node, const char *property,
 
 	while (ptr + na + ns <= end) {
 		if (i == index) {
-			res->start = fdtdec_get_number(ptr, na);
+			if (CONFIG_IS_ENABLED(OF_TRANSLATE))
+				res->start = fdt_translate_address(fdt, node, ptr);
+			else
+				res->start = fdtdec_get_number(ptr, na);
+
 			res->end = res->start;
 			res->end += fdtdec_get_number(&ptr[na], ns) - 1;
 			return 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
